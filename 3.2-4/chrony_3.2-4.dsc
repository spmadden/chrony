-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.2-4
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
 503fd337ea7ea8cd6d53a7d983c7f8aab03187e4 30836 chrony_3.2-4.debian.tar.xz
Checksums-Sha256:
 329f6718dd8c3ece3eee78be1f4821cbbeb62608e7d23f25da293cfa433c4116 433882 chrony_3.2.orig.tar.gz
 4434f5f6eca4781ac906e260db2444f9ce08df4406621e0c0b58818b5a78cb9c 163 chrony_3.2.orig.tar.gz.asc
 51408e08803d327bb06c3a3c390ce1348f344e21c3b4bfdd0aed6602660cdab5 30836 chrony_3.2-4.debian.tar.xz
Files:
 f4c4eb0dc92f35ee4bb7d3dcd8029ecb 433882 chrony_3.2.orig.tar.gz
 1cfedd4f4838de9b8c4bb8a7990d6750 163 chrony_3.2.orig.tar.gz.asc
 180dd82b0cc87408589a7afec53c01e7 30836 chrony_3.2-4.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAlqMeoYACgkQnFyZ6wW9
dQoEKAf/SqCSy7iBSz/A2Y8M5qY0IrNW9dG9wGcdW6ePzGFJiKXIRvvO7eacAul5
cPXko9ao+9ouqVNFmh8QmsOpc1/1sOUmdtWhNgv64/O6bdcmRdiC7RQaTzojyRNh
J4StSP1uwzQzQD9C3V8cfrZE8mwQe/kci+53H1vbkQwnOpOhZGS85Wf4nBhqAH5W
drt8n0T2xj+kuLiLqLNR7AUVzhsSJ2jYe2o27hA/9UBtx/0croirx+CUv/he1Yok
c2elITvc4mQ2suvIGyX2WdwNwvAF0O3Ur6nfL7ZrJV0WevE42OD+LmLF4JxMgYW2
f+vzEsIkjqio01VDyMx7qsPGnzK1Cw==
=Yblk
-----END PGP SIGNATURE-----
