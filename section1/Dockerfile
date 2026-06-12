FROM alpine:3.22

RUN apk add --no-cache \
    bash \
    ca-certificates \
    aws-cli \
  && addgroup -S app \
  && adduser -S app -G app

WORKDIR /app

COPY sync-with-s3.sh /app/sync.sh
RUN chmod +x /app/sync.sh

USER app

ENTRYPOINT ["/app/sync.sh"]