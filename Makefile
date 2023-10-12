all: install

run:
	docker-compose up --build -d

install:
	go install -v ./cmd/syslog-send

fmt:
	go fmt ./...

test:
	go test ./... -v

build:
	go build -o syslog-send cmd/syslog-send/main.go
