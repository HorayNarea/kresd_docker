#!/bin/sh

# do a DNS lookup to check health of kresd
dig @127.0.0.1 || exit 1

# run cache garbage collector
kres-cache-gc -c /data
