FROM golang:1.22-alpine as builder

WORKDIR /app
COPY . .
RUN go build -o server .

FROM golang:1.21-alpine
COPY --from=builder /app/server /app/server
ENTRYPOINT ["/app/server"]