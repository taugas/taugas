# Build Taugas in a stock Go builder container
FROM golang:1.10-alpine as builder

RUN apk add --no-cache make gcc musl-dev linux-headers

ADD . /taugas
RUN cd /taugas && make geth

# Pull Taugas into a second stage deploy alpine container
FROM alpine:latest

RUN apk add --no-cache ca-certificates
COPY --from=builder /taugas/build/bin/taugas /usr/local/bin/

EXPOSE 8545 8546 52527 52527/udp
ENTRYPOINT ["taugas"]
