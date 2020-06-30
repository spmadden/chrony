-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.5-9ubuntu2
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Joachim Wiedorn <joodebian@joonet.de>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.5.0
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, ethtool, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, wget
Build-Depends: asciidoctor (>= 1.5.3-1~), bison, debhelper-compat (= 12), dh-apparmor, libcap-dev [linux-any], libedit-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], net-tools <!nocheck>, nettle-dev, pkg-config, pps-tools (>= 0.20120406+g0deb9c7e-2) [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 79e9aeace143550300387a99f17bff04b45673f7 458226 chrony_3.5.orig.tar.gz
 5f1a418cd20a869ca69714e371c48adf070c028f 41832 chrony_3.5-9ubuntu2.debian.tar.xz
Checksums-Sha256:
 4e02795b1260a4ec51e6ace84149036305cc9fc340e65edb9f8452aa611339b5 458226 chrony_3.5.orig.tar.gz
 d025af34ffa9392a5fd3f69afbebcb3d528c019cc4870a62ee605299a5184d98 41832 chrony_3.5-9ubuntu2.debian.tar.xz
Files:
 5f66338bc940a9b51eede8f391e7bed3 458226 chrony_3.5.orig.tar.gz
 80415c980fc42a2142e0b87396b699a4 41832 chrony_3.5-9ubuntu2.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE7iQKBSojGtiSWEHXm47ISdXvcO0FAl76W44ACgkQm47ISdXv
cO0Cag//Ys0SuKSimb6xXaAUoDQw6zPocDMpPiqUV4m95GtpJnCfwnM+H8w6Z0WK
Wf2KdB7Uok43II6wXnNV0h8+TrKyA/8oxWnMupCBMh/uLi6bPw4+VQdgSz9JslnI
R7nPAojXwpQmIyli/5pYVTM22nSwo6NvcvQb24sqFCz9W+ywyfw1AYWjcQXVEV+g
u8o4Mnnuvwiep+I88PkeLHswxNpgOhw26uf01MvfD7InEsOSoa0/1A7SqNBvgDqw
dlQeH9yXbnO1UHvBYjaDzmJOmhBuDE/YeCENgo9AbOpiG3u5uOnEW247KB7w30VG
kqyHni7sX0hdbYaKstbWicukO2P0KDwRlHT4BkmG+YEFbNqNkri+ofssMQYz+OG9
IsOxdNPEghgbUvCvMLWnbjonRs7a22JXr6UUjsVdKOijR86E4DlWgmzqgsfR+6SF
zh7Bsw7RS+4s3oMJRNy1dJvS0nK2ELEcnn4p8TfE1XeJ3/rWCbekbmvCtehhAAqN
sYko8eVGFBQcsEvviMkV6wYCpmgLCfE3CAlNfUFINQGHsUGD7VjDkqx8aY4ny+R7
T7jm2uv9NHtWQXP42H13O2YvK7SuTs1IwF/6qKxJnlkDpb4AAurUIJNDDII0TULY
sd5n4jWg4DcR+1AYtq7R2h4hz/dMqLUhjlPA7cBJuRBuWDvPRPo=
=PVo9
-----END PGP SIGNATURE-----
