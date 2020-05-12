-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.5-5
Maintainer: Vincent Blut <vincent.debian@free.fr>
Uploaders: Joachim Wiedorn <joodebian@joonet.de>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.4.1
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
 94f33d96769ae822f3c4de82e5a8e1700ff8228d 35096 chrony_3.5-5.debian.tar.xz
Checksums-Sha256:
 4e02795b1260a4ec51e6ace84149036305cc9fc340e65edb9f8452aa611339b5 458226 chrony_3.5.orig.tar.gz
 7d9423677fa33cbca4f05649e564bc52e4ef3f00c2296c076318e96ebaea1c74 163 chrony_3.5.orig.tar.gz.asc
 af12b9b5b8aa9e334c3cdbba39ba5bb1c95db34593f160bbbfce99b775db45ef 35096 chrony_3.5-5.debian.tar.xz
Files:
 5f66338bc940a9b51eede8f391e7bed3 458226 chrony_3.5.orig.tar.gz
 ce3107a4dfa6eae979440b9054c16f2b 163 chrony_3.5.orig.tar.gz.asc
 18878982ce23a599fb6b099a774c51f7 35096 chrony_3.5-5.debian.tar.xz
Dgit: 2820bb2aa90cee573d45a896274df46dbcf3db7d debian archive/debian/3.5-5 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAl4BJFwACgkQnFyZ6wW9
dQpxPgf/VnDaQ4tfCf5FVT7AH0hWy+Q1d1iDAZi90DEAoFCp5hqXLiGdd3vwQIHC
s4orGyhvkzNwt/QoJxM/3i4GvwGHx7wVBLYDOE2td688KACL5IESWy8tezL4v0Fq
Ba8psM4/pI2WymVoUfq9BIdJdnSmdDCTx+BSYnc9WOcqSXEQNjaEv6RRP4d8XEjb
6keq2i1Ypmngmnbx+YuS0dNZRFROmDqHnax/aMj/Dct6QIrlJc9Ypwz4cXxIyVzL
hTNl0WrU2R1Tq0XFJw3T07As71WWhQqOZuwFL0opuXUgNTto8NsR2RjXX/nDb0XJ
UfwrpfNr3I6yxIMkZC13dN3Y4IHInw==
=Z2NV
-----END PGP SIGNATURE-----
