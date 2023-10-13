# The RX_VERSION is parsed by ci.yaml and cd.yaml, validate any changes there
ARG RX_VERSION="1.9.9"
FROM ghcr.io/equinor/radix/rx:${RX_VERSION} as builder

FROM alpine:3.18
COPY --from=builder /app/rx /usr/local/bin/rx
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh","/entrypoint.sh"]
