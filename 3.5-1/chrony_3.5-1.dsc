-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.5-1
Maintainer: Vincent Blut <vincent.debian@free.fr>
Uploaders: Joachim Wiedorn <joodebian@joonet.de>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.3.0
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential, ca-certificates, git, iproute2, isc-dhcp-client, isc-dhcp-server, kmod
Build-Depends: asciidoctor (>= 1.5.3-1~), bison, debhelper-compat (= 12), dh-apparmor, libcap-dev [linux-any], libedit-dev, libseccomp-dev (>= 2.2.3-3~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el s390x x32], net-tools <!nocheck>, nettle-dev, pkg-config, pps-tools (>= 0.20120406+g0deb9c7e-2) [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 79e9aeace143550300387a99f17bff04b45673f7 458226 chrony_3.5.orig.tar.gz
 064de66cbc43a6ea64ad269111b499e57adbb742 163 chrony_3.5.orig.tar.gz.asc
 ad6d02d0d92f793f8ed1d5d271a245bcbd06648e 30764 chrony_3.5-1.debian.tar.xz
Checksums-Sha256:
 4e02795b1260a4ec51e6ace84149036305cc9fc340e65edb9f8452aa611339b5 458226 chrony_3.5.orig.tar.gz
 7d9423677fa33cbca4f05649e564bc52e4ef3f00c2296c076318e96ebaea1c74 163 chrony_3.5.orig.tar.gz.asc
 2913ebe88d1f3da8048d2e569d9e6c9027597b753fddddb1e2c307209068636e 30764 chrony_3.5-1.debian.tar.xz
Files:
 5f66338bc940a9b51eede8f391e7bed3 458226 chrony_3.5.orig.tar.gz
 ce3107a4dfa6eae979440b9054c16f2b 163 chrony_3.5.orig.tar.gz.asc
 7fa28f42d8ee62f1fd23c609fab0a075 30764 chrony_3.5-1.debian.tar.xz
Dgit: 77eb04a95497e37a1e25c35e0fa6bc9026b2cccc debian archive/debian/3.5-1 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAlzcWTkACgkQnFyZ6wW9
dQqCygf/VLA4FCMptgq18SqmFBbPHxsBeNvw1LAftnDqJk6nkWf45AniC2T/O7yE
UWmXCWZOsZf+aRGNZEu7+H2V2tMm7KOkuCJoy9ftXHgaiZ/CvHONCOqzZVGPqw5B
0otys+Sv1mJ1qTqs1cWSfMV84Wc1u1Ss4rJpLRrZV20eVWB2vQ8H++IWsDBL+c1B
QhTovMWBy3OJ1UF+s+NmUb/xwyvJ1XFN558+wRK6+6yB38e02misnBf15QRxoFff
E21JgN31aart+9MfrSz/zVLxLV+fg8spin1+2KXOmYAlOiLwPqULxwX2vwDmFzJR
og9mCuviJh1RpKhPofafKGDQesPg8Q==
=P/Qr
-----END PGP SIGNATURE-----
