#!/bin/bash
# encoding: utf-8

SQUID_USER=squid
SQUID_DIR=/usr/local/squid

if [ ! -f $SQUID_DIR/ssl/bluestar.pem ]; then
    openssl req -new -newkey rsa:2048 -nodes -days 3650 -x509 -keyout $SQUID_DIR/ssl/bluestar.pem -out $SQUID_DIR/ssl/bluestar.crt\
	    -subj "/C=US/ST=Texas/L=Austin/O=BlueStar/OU=NetworkSecurity/CN=bluestar"
    openssl x509 -in $SQUID_DIR/ssl/bluestar.crt -outform DER -out $SQUID_DIR/ssl/bluestar.der
fi

/usr/sbin/e2guardian &
exec $SQUID_DIR/sbin/squid -f $SQUID_DIR/etc/squid.conf -NYCd 10
