FROM golang:alpine AS stage

WORKDIR /app

COPY ./hello.go .

RUN go mod init nakiba/helloworld

RUN go build

FROM scratch
WORKDIR /app
COPY --from=stage /app/helloworld .

CMD ["./helloworld"]