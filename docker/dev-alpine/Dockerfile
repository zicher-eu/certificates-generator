FROM alpine

RUN apk update && \
	apk add --no-cache openssl

COPY ./scripts /scripts

WORKDIR /scripts