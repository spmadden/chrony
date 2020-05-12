-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.2-4ubuntu3
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Joachim Wiedorn <joodebian@joonet.de>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.1.3
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential, ca-certificates, git, iproute2, isc-dhcp-client, isc-dhcp-server, kmod
Build-Depends: debhelper (>= 11), bison, libedit-dev, libnss3-dev, libcap-dev [linux-any], pps-tools (>= 0.20120406+g0deb9c7e-2) [linux-any], libseccomp-dev (>= 2.2.3-3~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el s390x x32], pkg-config, asciidoctor (>= 1.5.3-1~), dh-apparmor
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 64db6c31e013222cc0a2b66322192b4cedf6e048 433882 chrony_3.2.orig.tar.gz
 164a7b4caf16237968d02f9f341f6b235be9fbcf 34972 chrony_3.2-4ubuntu3.debian.tar.xz
Checksums-Sha256:
 329f6718dd8c3ece3eee78be1f4821cbbeb62608e7d23f25da293cfa433c4116 433882 chrony_3.2.orig.tar.gz
 4c7b28f0f6f24b59af2f7257bc3113ca1e02dc94e5b747afd4bb7b80c6f95476 34972 chrony_3.2-4ubuntu3.debian.tar.xz
Files:
 f4c4eb0dc92f35ee4bb7d3dcd8029ecb 433882 chrony_3.2.orig.tar.gz
 e067f0a1b8b911bbd8610e900a52cc07 34972 chrony_3.2-4ubuntu3.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJaxjnWAAoJELo+KTOCgLJCwT8QAJDg8a0+hHcNrJlRpN23LCVF
lNx4dFc7NZzHCriS5X2ZIgCchakfNnK/jywU8T5L2WgWKWkXa9uiBHO2NLcG1llr
sO7P+zdIz3u4Tj20fjjwnLm2if9JfmdK4w38dKe6S484rFOcEwE6CzebkgRPtNYi
SE2+Y4NZwKsX6VNp7dhmXAfs0SR8fc7R1cmVE8EIQYC+GH2ope6umR6EWs5iOYab
n00oG7ZWMA5axTis+EYYZv5LrIKnGjpwHYhCsfrYIt7DJfqIB354Y2LIh1QbxFOx
s+/hJZ/y5lZeHw3hyumd/kTe73faGJ6wXqo+zyerwaKqLU4G1ee4maPaiNw5rc0F
MZSZ5IKp9hn1v3Trge8DpT0vzxwhMCvn6ow2sO8cjDK9gI8K+W0ov99ED0EGHWBB
OYYf/4xvWFz0mxI2fG59B6x3WA4yow3mjDiTSYGSywKLjKwuy+qr5DDAutruhjVP
4R8f9yRm8zlxuGWkOBuvIv+oR2sVCx8c+SLu5DQ8tEOOKiv+wf4J8AuF1fp7bcGq
Pl8V7bR8ybMmsVbyKkvIU/dux67NBtSVVFzWTWd3EZkEzMCvMgFS3bKYAjDGlGRI
ZSBunEkKtqGdDkYy4fCmbhE/f+F3jVrLDExawyu6/6sLRcubU6XUMkNktM8KNQhK
HrNXCcdk0sHdAU7hoQrk
=GJqG
-----END PGP SIGNATURE-----
