-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.5-2
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
 f8932b475121379dd667be678cd48b28b6e0314a 31552 chrony_3.5-2.debian.tar.xz
Checksums-Sha256:
 4e02795b1260a4ec51e6ace84149036305cc9fc340e65edb9f8452aa611339b5 458226 chrony_3.5.orig.tar.gz
 7d9423677fa33cbca4f05649e564bc52e4ef3f00c2296c076318e96ebaea1c74 163 chrony_3.5.orig.tar.gz.asc
 a956ad373aa22494aa88369bfc529c86f853dbdb50a66503acefd5bfc2ee975e 31552 chrony_3.5-2.debian.tar.xz
Files:
 5f66338bc940a9b51eede8f391e7bed3 458226 chrony_3.5.orig.tar.gz
 ce3107a4dfa6eae979440b9054c16f2b 163 chrony_3.5.orig.tar.gz.asc
 b7f09366d1de42f19572a20e9d6c666c 31552 chrony_3.5-2.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAl0k8HgACgkQnFyZ6wW9
dQo+vggAptqiH4WKLUXpl5JPunLSK0gyKSyKYRciGa0nYP2N97yHEWtPV5Wv7rXF
Ro7wGYJ59zwgyAxicjRzq2XD28x4SeOLzJvw207hxlr7F58tuxu+GDjby1mMJB2X
Ga+YP3RPjV4jGLByqOUE8VDLcBKeMu18Uys21gYMjmq3VMA5bZuK6UYd3jyfJHHR
FRsK8gtfsvVkJMFCXV6nJOiZ3cRe52Ig4KPIWZ2ezdzomaSWV/BHGX4zWtmy0CZp
nHt74GNzI54PKCHef8TKVp4wLIKCByqhkWpzOQm0zyZSZjtU6sJNjatKRz3Y8eKt
+/S++ZKnX2cOpaXiZVoC2nog64mKmA==
=e2B2
-----END PGP SIGNATURE-----
