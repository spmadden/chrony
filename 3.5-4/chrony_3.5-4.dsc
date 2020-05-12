-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.5-4
Maintainer: Vincent Blut <vincent.debian@free.fr>
Uploaders: Joachim Wiedorn <joodebian@joonet.de>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.4.0
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, ethtool, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, wget
Build-Depends: asciidoctor (>= 1.5.3-1~), bison, debhelper-compat (= 12), dh-apparmor, libcap-dev [linux-any], libedit-dev, libseccomp-dev (>= 2.2.3-3~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el s390x x32], net-tools <!nocheck>, nettle-dev, pkg-config, pps-tools (>= 0.20120406+g0deb9c7e-2) [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 79e9aeace143550300387a99f17bff04b45673f7 458226 chrony_3.5.orig.tar.gz
 064de66cbc43a6ea64ad269111b499e57adbb742 163 chrony_3.5.orig.tar.gz.asc
 6074bc26ff74b6eedef56f5d4cac77fb561f4f52 32384 chrony_3.5-4.debian.tar.xz
Checksums-Sha256:
 4e02795b1260a4ec51e6ace84149036305cc9fc340e65edb9f8452aa611339b5 458226 chrony_3.5.orig.tar.gz
 7d9423677fa33cbca4f05649e564bc52e4ef3f00c2296c076318e96ebaea1c74 163 chrony_3.5.orig.tar.gz.asc
 a986aac5cb9aefb19f24a63ba53bccf710f6abc05aa8ceb33684fa8bd45dd08c 32384 chrony_3.5-4.debian.tar.xz
Files:
 5f66338bc940a9b51eede8f391e7bed3 458226 chrony_3.5.orig.tar.gz
 ce3107a4dfa6eae979440b9054c16f2b 163 chrony_3.5.orig.tar.gz.asc
 92a60e7b53130a745338bcf1b6427381 32384 chrony_3.5-4.debian.tar.xz
Dgit: 03d90ae4fbbf8e19bf74d4c5d2be668aef6c1b58 debian archive/debian/3.5-4 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAl1ra5QACgkQnFyZ6wW9
dQrWEwf+PnGLbjWwn7Xc0luY6pK+rL84WGp7UCln2CKDxo65r1f1PeDScfJlDPyQ
GpVRw/hgkPQ65KUG3ikpf1Lk17Jwjqt5JM9N6RWOYpV4ljU5Jk96KZiUK8ogjtJF
Tg8LilS3DuJtCwPY2MyGU9ZRrQm52/Ev/UwsMVqUY7WOEJxXK6uuy5D8Ep/VhWnl
uwfeQ6yzOJGbT0hOV26+Wy/7w6HYwvb3norf6ZV7cBkIpr9N3TDljmrUf+Hu/hN+
MEktVvo4go8+d7OEO/CT8I1cBu1UJ3zzLzYmsJc+aMS7f8992cqgD4/ww6SQgA9E
krHazAqHeeXhZ4Bsw0HiRcJpKO84Dw==
=qaJS
-----END PGP SIGNATURE-----
