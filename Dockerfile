FROM alpine:latest

RUN apk add --no-cache git bash curl

RUN curl -sSL https://github.com/getzola/zola/releases/download/v0.22.1/zola-v0.22.1-x86_64-unknown-linux-musl.tar.gz \
    | tar -xz -C /usr/local/bin

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 1111
ENTRYPOINT ["/entrypoint.sh"]
