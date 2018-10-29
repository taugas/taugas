.PHONY: build cluster test

default: build

build:
	go build -o bin/swarm    github.com/taugas/taugas/cmd/swarm
	go build -o bin/geth     github.com/taugas/taugas/cmd/geth
	go build -o bin/bootnode github.com/taugas/taugas/cmd/bootnode

cluster: build
	scripts/boot-cluster.sh

test:
	go test -v github.com/taugas/taugas/swarm/...
