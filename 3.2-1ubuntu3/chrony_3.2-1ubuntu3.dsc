-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.2-1ubuntu3
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Joachim Wiedorn <joodebian@joonet.de>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.1.0
Vcs-Browser: https://anonscm.debian.org/cgit/collab-maint/chrony.git
Vcs-Git: https://anonscm.debian.org/git/collab-maint/chrony.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential, ca-certificates, git
Build-Depends: debhelper (>= 10), bison, libedit-dev, libtomcrypt-dev, libcap-dev [linux-any], pps-tools (>= 0.20120406+g0deb9c7e-2) [linux-any], libseccomp-dev (>= 2.2.3-3~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el s390x x32], pkg-config, asciidoctor (>= 1.5.3-1~), dh-apparmor
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 64db6c31e013222cc0a2b66322192b4cedf6e048 433882 chrony_3.2.orig.tar.gz
 4c25f1d9de8c9345f5fe39a23fc7048e43e22e62 27988 chrony_3.2-1ubuntu3.debian.tar.xz
Checksums-Sha256:
 329f6718dd8c3ece3eee78be1f4821cbbeb62608e7d23f25da293cfa433c4116 433882 chrony_3.2.orig.tar.gz
 288f861fc82a290e8500899ace6b22c4d3e65a7bc09e7d5a2736d275f010294f 27988 chrony_3.2-1ubuntu3.debian.tar.xz
Files:
 f4c4eb0dc92f35ee4bb7d3dcd8029ecb 433882 chrony_3.2.orig.tar.gz
 16be73ec9d6dd189157c334d681c00ef 27988 chrony_3.2-1ubuntu3.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJaZ2p4AAoJEFHb3FjMVZVz8h0P/jnioEHy3wTP0lamZ1G7FgsB
hX7VU/TfxQyS9ZatBiz4ENQxyp4CpQ8W0OxJEczqzQPK9DImHJyZvNa8WHkeebwj
QO1c7CghAdfenjFrUib175yhkUjydcRxcyPEpjTLpWEX9zWraP5KEL0Kw3f/s4j6
qyYiNHPr0a9jLJiGPFj0qMV9W46CjDxV6QJrjUyhpXGrzC0OClVT2ITo2YPPgQBW
CbqF49XzG+8UqZYrlltMel4FHX8RC53ZVM1Wzu0aNmnw0eeAZAAjNZ7pxal+N5YJ
UMX5SC2UvF5i/8zcmIuJzUBZLBPz82UoEW7VBLlrAixUS3UnZxlFGD8ne2RCwuuJ
0uCzKTgzlTtrr9Gwlmq5XD4q9UdynY9nhFm2jK3R6Ik9bqKnYPMr+n5j76HxcXGl
Kq/scx93rSWI2Y2HT5oaWK2CW4pRy/Mt8rBSqW9PnYGmRwishP4bQOrRH0i+LagI
sAZNkKIDzWjq4MXUb3h5d/Ov90TUQC9DfXiIBRtgrmMUbdaspARlHidqb/bw9TQ3
CF3zYyk5Pc1GtTrfC7KfI+aOoaUG5m2kffreXMnAszNQBDr5tvzKEerbAbkixFPq
yj5B7oo2i5TQLt4NTfFEE3vJEWbgYrqvXLOTOWruBfqWFuBbp0wG532gy2g274IP
ZRTpbzXof2naaCkbAqMx
=Bmeu
-----END PGP SIGNATURE-----
