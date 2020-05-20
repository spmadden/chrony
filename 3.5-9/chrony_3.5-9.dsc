-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.5-9
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
 ade7baa44fd88c3e32b8da2c6add1cf7cd3cde00 36952 chrony_3.5-9.debian.tar.xz
Checksums-Sha256:
 4e02795b1260a4ec51e6ace84149036305cc9fc340e65edb9f8452aa611339b5 458226 chrony_3.5.orig.tar.gz
 7d9423677fa33cbca4f05649e564bc52e4ef3f00c2296c076318e96ebaea1c74 163 chrony_3.5.orig.tar.gz.asc
 79fb248c4681af3edd41a0789560d56128d2b9e9c35e1927b9b29be6748540e4 36952 chrony_3.5-9.debian.tar.xz
Files:
 5f66338bc940a9b51eede8f391e7bed3 458226 chrony_3.5.orig.tar.gz
 ce3107a4dfa6eae979440b9054c16f2b 163 chrony_3.5.orig.tar.gz.asc
 fcd71a3e79ba1bd02cec31fbfde88a90 36952 chrony_3.5-9.debian.tar.xz
Dgit: 3f85268f6b6fecae47c6bdd1e1dfd94a2947b48f debian archive/debian/3.5-9 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAl7ELUcACgkQnFyZ6wW9
dQoWQAf/WWKzzW1JdaKyWS8gqQb/SmB3mGWMVZ4RE71+2Qyjnzu15B8iV4q5QkpD
nSTF9Ti52vD6bF2dmWrG72MzI6/WLNznGPIb0ezvgc7s6MagjU0snpgrK46KCLHB
BmVLu0mHLUCEMazQchs58LGsu28qYT+luVVpcDSWCAjszjchEWDYXGXWjUpLt9uT
NYF/XsyuIaDcBaSD/bulxWRgJ/pgPY6wUbmq/VCjA9qXXhMVihS47XN1eTHRsJHf
x7hjWaRU0Pb6UIbA7LDXtkW8LNSj2xcukWdh4/hjb+WchinV4X+E71rQqnrmkc4c
kkGwzXaEMctk6cRdq1wfajCsKuaaRg==
=UEfZ
-----END PGP SIGNATURE-----
