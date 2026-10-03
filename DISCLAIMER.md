# Disclaimer

Please read this before you use, copy or distribute anything in this repository.

## Not affiliated

This is an independent, unofficial project. It is not affiliated with, endorsed by, sponsored by or connected to the original developers, publishers or operators of the game whose Flash client it serves, or to Adobe, Supabase, or any other third party named in this repository. All product names, trademarks and registered trademarks belong to their respective owners and are used only to describe compatibility.

## Purpose

The server code was written by observing how an existing Flash client talks to its server, so that the client keeps working after the original service is gone. It is offered for education, research, interoperability and software preservation. It is not meant for commercial use, and it is not meant to harm or compete with any rights holder.

## Third-party materials

The source code written for this project is released under the [Apache License 2.0](./LICENSE). That license does **not** cover third-party material that lives in or is served from this repository, whose rights stay with their owners. This includes:

- `docs/client/`: decompiled ActionScript from the game client, kept as a read-only reference.
- `frontend/`: the client SWF files and game assets served to the client.
- `docs/flashplayer/`: the Adobe Flash Player standalone projector, which is Adobe's proprietary software.
- `pkg/rtmp/` and `pkg/amf0/`: vendored, modified forks of [yutopp/go-rtmp](https://github.com/yutopp/go-rtmp) and [yutopp/go-amf0](https://github.com/yutopp/go-amf0), which keep their own license (Boost Software License 1.0).
- `docker/`: derived from the upstream [Supabase](https://github.com/supabase/supabase) self-hosting files, which keep their upstream license.
- Data under `supabase/seeds/`, which may be derived from the original game's data.

You are responsible for making sure you have the right to use, copy and distribute these materials in your jurisdiction. If you cannot get that right, delete them.

If you are a rights holder and want something removed, open an issue on the repository and it will be dealt with promptly.

## No warranty

This software is provided "as is", without warranty of any kind, express or implied, including but not limited to merchantability, fitness for a particular purpose and non-infringement. The authors and contributors are not liable for any claim, damages or other liability arising from the use of, or other dealings in, the software. See sections 7 and 8 of the [Apache License 2.0](./LICENSE).

## Security and data

- The project is under active development and has not been through a formal security audit. Do not expose it to the public internet without reviewing the configuration yourself.
- The default configuration is for development. Before you deploy, change every secret (`docker/.env`, `ADMIN_DASHBOARD_SECRET`, the Studio password) and keep Postgres and Studio on `127.0.0.1`.
- You are responsible for the personal data of any players on a server you run, including compliance with the privacy laws that apply to you.
- Security research notes in `docs/research/` describe weaknesses of the original client and protocol. Use them only on systems you own or have permission to test.

## Use at your own risk

If you run a server based on this project, you do so at your own risk and under your own responsibility. The authors do not support, and are not responsible for, any service built on it.
