# Build on Docker

## Build command

```sh
docker compose up -d --build
```

## Stop command

```sh
docker compose down
```

## Remove danling images

```sh
docker image prune -f
```

## Client URL

```sh
http://localhost:8888/s/sv/GameLoaders.swf?isExpand=true
```

Open it in the standalone Flash Player projector from `docs/flashplayer/` (`File` → `Open...`). See "Play the Game" in the root `README.md`.

## Browser Flash Support

- Windows Maxthon 5: [Download](https://dl.maxthon.com/mx5/mx5.1.3.2000.exe)
- MacOS 360Chrome: [Download](https://down.360safe.com/cse/360Browser_for_mac_12.2.1662.0.pkg)
