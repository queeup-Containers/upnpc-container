# miniupnpc in a container

## Tags

- `latest`: latest upnpc binary on top of [scratch](https://hub.docker.com/_/scratch) image
  - `v2.2.4-r0`: you can choose specific version of upnpc

## Pull

```bash
podman pull docker.io/queeup/upnpc-container

# OR

podman pull ghcr.io/queeup/upnpc-container
```

## Use

```bash
podman run \
    --rm \
    --interactive \
    --tty \
    --network host \
    upnpc-container --help
```

## Build

```bash
podman build -t upnpc-container --file Containerfile
```

[Containerfile is here](https://github.com/queeup/upnpc-container/blob/main/Containerfile)
