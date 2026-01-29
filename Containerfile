ARG ALPINE_CHANNEL
FROM alpine:${ALPINE_CHANNEL} AS build

ARG APP_VERSION
RUN apk add --no-cache miniupnpc=${APP_VERSION}

FROM scratch
COPY --from=build /usr/bin/upnpc /bin/
COPY --from=build /usr/lib/libminiupnpc.so.* /lib/ld-musl-*.so.1 /lib/

ENTRYPOINT ["/bin/upnpc"]
