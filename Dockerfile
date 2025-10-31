FROM alpine:3.22
RUN apk update
RUN apk add --no-cache bind-tools
ENTRYPOINT ["sh","-c","while true; do sleep 3600; done"]
