#!/bin/sh

# run cache garbage collector
kres-cache-gc -c /cache

# do a DNS lookup to check health of kresd
dig @127.0.0.1
