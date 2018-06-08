FROM golang:1.10-alpine

# see https://github.com/Yelp/dumb-init
RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.1/dumb-init_1.2.1_amd64
RUN chmod +x /usr/local/bin/dumb-init

RUN mkdir -p /go/src/github.com/cameronwp/serve_static /static
WORKDIR /go/src/github.com/cameronwp/serve_static
ADD main.go /go/src/github.com/cameronwp/serve_static
RUN go build -o serve_static main.go

ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]
