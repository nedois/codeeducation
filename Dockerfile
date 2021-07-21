FROM golang:1.16 AS go-builder

WORKDIR /go/src

COPY . .

RUN go build app.go 

FROM scratch

COPY --from=go-builder /go/src/app ./app

ENTRYPOINT ["./app"]