FROM alpine:3.19
LABEL maintainer "Thomas Sänger <thomas@gecko.space>"

RUN apk add --no-cache \
  bind-tools \
  knot-resolver \
  knot-resolver-mod-http \
  && mkdir /data \
  && chown kresd /data \
  && touch /kresd.conf

COPY check_and_gc.sh /check_and_gc.sh

EXPOSE 53/udp 53/tcp 8453/tcp

VOLUME "/data"

CMD /usr/sbin/kresd -n -c /kresd.conf /data

HEALTHCHECK CMD /check_and_gc.sh || exit 1
