FROM alpine:3.11
LABEL maintainer "Thomas Sänger <thomas@gecko.space>"

RUN apk add --no-cache \
  bind-tools \
  ca-certificates \
  knot-resolver \
  knot-resolver-mod-http \
  lua-filesystem \
  && mkdir /cache \
  && chown kresd /cache \
  && touch /kresd.conf

COPY check_and_gc.sh /check_and_gc.sh

EXPOSE 53/udp 53/tcp

VOLUME "/cache"

CMD /usr/sbin/kresd /cache -c /kresd.conf -f $(nproc)

HEALTHCHECK CMD /check_and_gc.sh || exit 1
