# syntax=docker/dockerfile:1
# Place comments here...

FROM golang:1.21.1

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux go build -o /photo_app

EXPOSE 8080

CMD ["/photo_app"]