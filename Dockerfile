FROM golang:1.22.4 AS builder

WORKDIR /app

COPY go.mod ./
COPY hello.go ./

#RUN go run .
RUN go build -o hello .


FROM scratch
WORKDIR /app
COPY --from=builder /app/hello  ./hello

CMD ["./hello"]


