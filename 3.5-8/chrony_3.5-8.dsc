-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.5-8
Maintainer: Vincent Blut <vincent.debian@free.fr>
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
 064de66cbc43a6ea64ad269111b499e57adbb742 163 chrony_3.5.orig.tar.gz.asc
 dcdcb91eb791918f2aa91d33d40dc2a06c94869f 36376 chrony_3.5-8.debian.tar.xz
Checksums-Sha256:
 4e02795b1260a4ec51e6ace84149036305cc9fc340e65edb9f8452aa611339b5 458226 chrony_3.5.orig.tar.gz
 7d9423677fa33cbca4f05649e564bc52e4ef3f00c2296c076318e96ebaea1c74 163 chrony_3.5.orig.tar.gz.asc
 4486be30a3a62b821fd9b50b0320b8a07b0d2a32953d6e0fb37d0a80abc47318 36376 chrony_3.5-8.debian.tar.xz
Files:
 5f66338bc940a9b51eede8f391e7bed3 458226 chrony_3.5.orig.tar.gz
 ce3107a4dfa6eae979440b9054c16f2b 163 chrony_3.5.orig.tar.gz.asc
 5ab52c3a994fe08aed59a7b1114efc05 36376 chrony_3.5-8.debian.tar.xz
Dgit: 132e6d2dc9a17fbce790e76cb4d7b6a1d98e0879 debian archive/debian/3.5-8 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAl6KHfIACgkQnFyZ6wW9
dQq1+QgAlCrg4/Z4TL2Q6AZGZJXoqVq1833i2HRT16lNnFvy/YxvDCVxSSufQZ1j
piyZE17NAvkA7TwMUdvG/4HVoYD9a8IsJn7DFdnjk3lg0Jg5YVYkkb7iHIKP2Oh5
Sh99QZ0KIuKKG4ugSkm2N+r3IRcBddt/MS8unh8szOMse0/IIGYbX2yeXgsMzKxB
5W4kQ6jSnZTWP3zVUIGEaMpjd8KCWzR+of74e2ayZMoPJgsP859jzM+3OyodS4Af
NyEDiO6v1l7Tzdu2bv6lBEtDI0Pz3P/t0wZ253rLpzm3kss3aMa+ioUPfoVydhVZ
g5bRvKi7WbEnLUZ9urR5hRrRArtSxg==
=ua7y
-----END PGP SIGNATURE-----
