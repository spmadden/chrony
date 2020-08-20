-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.5.1-1
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
 3decde1c1d56e87d89b34cba662266a945453b3a 459902 chrony_3.5.1.orig.tar.gz
 1e2aa18c3752c4f9532c4876780f6de8433ae9bc 37012 chrony_3.5.1-1.debian.tar.xz
Checksums-Sha256:
 1ba82f70db85d414cd7420c39858e3ceca4b9eb8b028cbe869512c3a14a2dca7 459902 chrony_3.5.1.orig.tar.gz
 8c340963c6373e917c81b491a57bf66a2d56ea7794454b06db5e63c80872dd01 37012 chrony_3.5.1-1.debian.tar.xz
Files:
 1dfc70ae8fd18f0456101b7a91b30234 459902 chrony_3.5.1.orig.tar.gz
 0798cad4aa1064c3d345b84ff456e251 37012 chrony_3.5.1-1.debian.tar.xz
Dgit: 23acf3f6ac762d9e669bbed42c0a033be3756101 debian archive/debian/3.5.1-1 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAl8+z6YACgkQnFyZ6wW9
dQpFzAf+Kxx3g3HfZFk0sVaw2763gQ/Af2u6Hwrdy78SOEA1IVZ5Vcy61TXBXUVE
LzlJTmiO+PJX/OuXmBuywrgGB7pEUlrT1Fr3dE1XminrGmumQwIZt1NNF3HPrDay
BzMZjgQwIs3irpJ4vbCxDQ5yk8oKz5/Oms2j47ykaY7t3SO7l0ywZ5XDAkZoLxvE
cOpnzUdql8njyQWU4Pdg4/5By3+mNRn2whbghEfHZUmW2QfGZQYSyZ/54WXy21rq
4rIFIDOvlpJHSJtGHUNP6qv0wRCjHsnIDZZuADsBX+DT9haDZHRlYN1nl5OjkvWs
KYvxV7Jya2v1Y+TUuWidgJdSCQIWfg==
=AnCk
-----END PGP SIGNATURE-----
