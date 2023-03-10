FROM golang:1.19

WORKDIR /app
ADD . /app

RUN make build

FROM alpine:latest
RUN apk add --no-cache ca-certificates
COPY --from=0 /app/build/bin/* /bin/

EXPOSE 8080/tcp
#USER nobody
ENTRYPOINT ["/bin/go-camo"]
