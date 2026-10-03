# Resource Hash Restore Workflow

The Flash client resolves assets in two layers:

- `ResManager.getUrl(code)` decodes numeric resource IDs with `GamePredef.RES_URL_FOLDER`, `RES_URL_WORD1`, `RES_URL_WORD2`, and `RES_URL_EXT`.
- `ResManager.hash(path)` requests `md5(path)` from the resource CDN under `res/<md5>`.

Local hashed assets in this repo live in `frontend/s/res` as bare MD5 filenames. To restore them into readable paths, use:

- source tool: `cmd/scripts/restore_resources/main.go`
- build: `go build -o bin/restore_resources ./cmd/scripts/restore_resources`
- run: `./bin/restore_resources`

The restore tool scans repo text files for numeric resource codes, explicit `resource/...` and `icon/...` paths, and bare asset names such as `NPC_CRE_000001.jpg`. It hashes candidate logical paths with the same MD5 strategy as the client, matches them against the local cache, and writes restored files into `temp/exported-resources`.

Current observed output on the existing cache:

- source hashed files: `9673`
- enumerated logical paths: `17925`
- restored files: `6698`
- restored `resource/*`: `1815`
- restored `icon/*`: `4883`
- missing logical paths: `11227`
- unmatched source hashes: `2973`

Reports written by the tool:

- `temp/exported-resources/manifest.tsv`
- `temp/exported-resources/missing-paths.txt`
- `temp/exported-resources/unmatched-hashes.txt`
- `temp/exported-resources/summary.txt`

The repo also has a targeted remote backfill command for unresolved logical paths:

- source command: `cmd/scripts/crawl-res`
- build: `go build -o bin/crawl-res ./cmd/scripts/crawl-res`
- targeted fetch: `./bin/crawl-res -mode missing -missing-file temp/exported-resources/missing-paths.txt`
- full refresh plus backfill: `./bin/crawl-res -mode refresh -destination frontend/s/res -missing-file temp/exported-resources/missing-paths.txt`

`crawl-res -mode missing` does not download by logical path directly. It reads logical paths from `missing-paths.txt`, generates the same hash-input variants used by `restore_resources`, downloads any matching MD5 blobs from `https://s3-vuaphapthuat.goplay.vn/s/res/`, and stores them in `frontend/s/res`.

`crawl-res` also supports `-overwrite` for replacing existing hash files and `-mode refresh` for a one-command cache refresh workflow. `refresh` re-downloads the remote listing into `frontend/s/res` with replacement enabled, then runs the missing-path hash backfill against the same destination.

After a missing download pass, re-run `bin/restore_resources` to materialize any newly fetched blobs into `temp/exported-resources`.

After a real `-mode refresh` run on 2026-04-21:

- listing stage: `9657` total, `3` downloaded, `9618` replaced, `36` failed
- missing stage: `11222` processed, `0` downloaded, `11222` failed
- follow-up restore summary: `9673` source hashes, `17925` candidate paths, `6698` restored, `11227` missing, `2973` unmatched hashes

Observed validation:

- control path `icon/creature/NPC_CRE_000001.jpg` downloaded successfully into a temporary destination through `-mode missing`
- the first three true missing creature SWF entries still failed remotely, which indicates some unresolved logical paths are absent from the remote bucket as well as the local cache
