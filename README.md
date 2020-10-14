[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/xtr0py/dnscrypt-proxy-2-docker.svg)](https://hub.docker.com/r/xtr0py/dnscrypt-proxy-2-docker)
![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/xtr0py/dnscrypt-proxy-2-docker)
[![Docker Pulls](https://img.shields.io/docker/pulls/xtr0py/dnscrypt-proxy-2-docker.svg)](https://hub.docker.com/r/xtr0py/dnscrypt-proxy-2-docker)

This is a Docker image containing [DNSCrypt Proxy 2.x](https://github.com/jedisct1/dnscrypt-proxy). You can use this to set up a DNS server on your local network which resolves queries using DNSCrypt or DNS-over-HTTPS (DoH) rather than sending plaintext DNS queries over the Internet.

This image comes with a configuration which:

* Looks up queries via DNS-over-HTTPS (DoH) and DNSCrypt
* DNSSEC, no logging, no filtering servers enabled
* Listens on all interfaces

The unstable docker container is being actively edited with the following differences
- [x] DNScrypt updated 2.0.44; stable is using an older version
- [x] Updated public-resolvers to v3
- [x]  Reverted to master with a much simpler .toml file
- [ ]  Trial performance with pihole after disabling DNScrypt cache'ing

You can run with this configuration:

`docker run -p 53:53/udp xtr0py/dnscrypt-proxy-2-docker`

If you wish to override the configuration:

`docker run -p 53:53/udp  -v /path/to/dnscrypt-proxy.toml:/config/dnscrypt-proxy.toml xtr0py/dnscrypt-proxy-2-docker`

