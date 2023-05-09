FROM golang:alpine AS builder
RUN mkdir /prometheus-apiserver-task
COPY . /prometheus-apiserver-task
WORKDIR /prometheus-apiserver-task
RUN go build .

FROM alpine
WORKDIR /prometheus-apiserver-task
COPY --from=builder /prometheus-apiserver-task/ /prometheus-apiserver-task/

ENTRYPOINT ["./prometheus-apiserver-task"]