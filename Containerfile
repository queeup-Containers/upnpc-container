ARG ALPINE_VERSION=3.18

FROM alpine:${ALPINE_VERSION} as build
ARG MINIUPNPC_VERSION=2.2.4-r0
RUN apk add --no-cache miniupnpc=${MINIUPNPC_VERSION}

FROM scratch
COPY --from=build /usr/bin/upnpc /bin/
COPY --from=build /usr/lib/libminiupnpc.so.* /lib/ld-musl-*.so.1 /lib/

ENTRYPOINT ["/bin/upnpc"]
