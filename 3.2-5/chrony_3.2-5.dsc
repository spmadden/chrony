-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.2-5
Maintainer: Vincent Blut <vincent.debian@free.fr>
Uploaders: Joachim Wiedorn <joodebian@joonet.de>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.1.3
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential, ca-certificates, git, iproute2, isc-dhcp-client, isc-dhcp-server, kmod
Build-Depends: debhelper (>= 11), bison, libedit-dev, libtomcrypt-dev, libcap-dev [linux-any], pps-tools (>= 0.20120406+g0deb9c7e-2) [linux-any], libseccomp-dev (>= 2.2.3-3~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el s390x x32], pkg-config, asciidoctor (>= 1.5.3-1~), dh-apparmor
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 64db6c31e013222cc0a2b66322192b4cedf6e048 433882 chrony_3.2.orig.tar.gz
 ba1863397b701d56f86d929c09c6054837a16cd6 163 chrony_3.2.orig.tar.gz.asc
 74f9aea999beb77e71f55f34a6256f28e969aa5a 30832 chrony_3.2-5.debian.tar.xz
Checksums-Sha256:
 329f6718dd8c3ece3eee78be1f4821cbbeb62608e7d23f25da293cfa433c4116 433882 chrony_3.2.orig.tar.gz
 4434f5f6eca4781ac906e260db2444f9ce08df4406621e0c0b58818b5a78cb9c 163 chrony_3.2.orig.tar.gz.asc
 a8181e9819b55beff4902606471baecd667626d10a7c82d57bc37f802a4de024 30832 chrony_3.2-5.debian.tar.xz
Files:
 f4c4eb0dc92f35ee4bb7d3dcd8029ecb 433882 chrony_3.2.orig.tar.gz
 1cfedd4f4838de9b8c4bb8a7990d6750 163 chrony_3.2.orig.tar.gz.asc
 6b45f858bf6c671c7a9d47505661837b 30832 chrony_3.2-5.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAlqqsuoACgkQnFyZ6wW9
dQoNSwgArN3EZ+WDncb5vwQeMWs9jDwHRsBStPLbSh0AfwbxyfmIAcS+eIYzFGBI
WBf5TLcR8LhSI7/w3JpIoHTuMWEh2d1bd6or5mu04VIjn3tR9HTj6SQ6ZDHo7ENx
YqOLf0Zwo/i5JcCtTBm1WZoce4v0iOcpRxIF4m9tup6Mdo2vu1r2DOUpg5f6x50N
bgv+lAo9SsSEgd1/k6SnYQGiGQDXZgjKmz0R/VJJxaolE+ZXQi2DKmMq6vK6lHpq
pLoy70twYniG5AJ7QYS8WbALMY70F0Vgn4I+v+t5Swt9Vovp6qrVgtSrxfY9ckU5
FBrfqhDFXw7yV5zPH+L8UHt3QCil3g==
=VdT1
-----END PGP SIGNATURE-----
