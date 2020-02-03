#!/bin/sh

# run cache garbage collector
kres-cache-gc -c /data

# do a DNS lookup to check health of kresd
dig @127.0.0.1
