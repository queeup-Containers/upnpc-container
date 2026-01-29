ARG ALPINE_VERSION=edge

FROM alpine:${ALPINE_VERSION} AS build
ARG MINIUPNPC_VERSION=2.3.3-r1
RUN apk add --no-cache miniupnpc=${MINIUPNPC_VERSION}

FROM scratch
COPY --from=build /usr/bin/upnpc /bin/
COPY --from=build /usr/lib/libminiupnpc.so.* /lib/ld-musl-*.so.1 /lib/

ENTRYPOINT ["/bin/upnpc"]
