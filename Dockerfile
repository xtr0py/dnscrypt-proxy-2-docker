FROM golang:alpine AS build

ARG RELEASE_TAG=2.1.15
ENV RELEASE_TAG=$RELEASE_TAG

RUN apk --no-cache add git && \
    git clone --depth 1 --branch "${RELEASE_TAG}" https://github.com/DNSCrypt/dnscrypt-proxy.git /src && \
    cd /src && \
    CGO_ENABLED=0 GOOS=linux go install -a -ldflags '-s -w -extldflags "-static"' -v ./...

FROM alpine

RUN apk --no-cache add ca-certificates

COPY --from=build /go/bin/dnscrypt-proxy /usr/local/bin/dnscrypt-proxy

ADD config /config

EXPOSE 53/udp

CMD ["dnscrypt-proxy", "-config", "/config/dnscrypt-proxy.toml"]

