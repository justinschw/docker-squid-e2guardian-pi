#docker-squid-e2guardian-rpi
======================
<img src="http://e2guardian.org/cms/images/banners/logo-guardian.png" alt="e2g" width="100"> [e2guardian](http://e2guardian.org/) is an Open Source web content filter.

This is a docker container made for raspberry pi that contains a squid proxy with SSL bump and e2guardian together.
It is based on both e2guardian and syakesaba/docker-sslbump-proxy.
I created this combination docker container to simplify the internal networking needed for ICAP.

Baseimage
======================
raspbian/stretch

### Quickstart 
```bash
docker run --name e2guardian-rpi -d --restart=always \
  --publish 3128:3128 \
  --volume /path/to/e2gaurdian/lists:/etc/e2guardian/lists \
  --volume /path/to/squid/conf:/etc/squid \
  --link some-squid:proxy \
  docker-squid-e2guardian-rpi
```

