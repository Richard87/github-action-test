ARG RX_VERSION="new_version"
FROM ghcr.io/equinor/radix/rx:${RX_VERSION} as builder

FROM alpine:3.18
COPY --from=builder /app/rx /usr/local/bin/rx
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh","/entrypoint.sh"]