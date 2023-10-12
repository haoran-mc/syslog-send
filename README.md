# intro

Forked from here: [github.com/cirocosta/syslog-send](https://github.com/cirocosta/syslog-send).

Customize certain configurations and utilize `go mod vendor` instead.

<!--
## vendor

```
go mod vendor
```
-->

# syslog-send

An example of how to use [Golang's `log/syslog` package](https://golang.org/pkg/log/syslog/) to send `syslog` messages to a particular syslog facility.

The repository also includes a sample Docker image that has an `rsyslog` server listening on port 514/udp forwarding any syslog messages sent to it to `stdout`.

## rsyslog server

First, create the `rsyslog` server:

```sh
# The Makefile under the root of this repository
# contain a `docker-compose` file that builds the
# image at `./image` and then runs the container
# with the right port mapping in place.
make run
```

Second, syslog-cli send message:

```sh
# Build syslog cli.
make build

# Send a message to the rsyslog installation using
# the default parameters.
./syslog-send this is a message!

# Check the logs from the rsyslog container to
# verify that we indeed received the message.
docker logs rsyslog
2023-10-12T04:25:38Z ran-macbook-air.local custom-tag[528]: this is a message!
```

See below ↓ for more parameters.

## cli args

```
Usage:
  syslog-send [OPTIONS] Message...

Application Options:
      --address=   address of the syslog server (default: 127.0.0.1:514)
      --transport= transport to use (tcp|udp) (default: udp)
      --facility=  name of the syslog facility to send msgs to (default: local0)
      --severity=  severity of the message (default: emerg)

Help Options:
  -h, --help       Show this help message
```

```sh
./syslog-send --address="127.0.0.1:514" --transport="udp" --facility="local1" --severity="notice"
```
