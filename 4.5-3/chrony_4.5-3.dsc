-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.5-3
Maintainer: Vincent Blut <vincent.debian@free.fr>
Homepage: https://chrony-project.org
Standards-Version: 4.7.0
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git -b debian/latest
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, dpkg-dev, ethtool, gnutls-bin, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, tzdata-legacy, wget
Build-Depends: asciidoctor, bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, iproute2 [linux-any] <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], nettle-dev, pkgconf, pps-tools [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 4661e5df181a9761b73caeaef2f2ab755bbe086a 620287 chrony_4.5.orig.tar.gz
 d5bd0be4ef248fa9b9a81695f6b2265c3a24db6f 833 chrony_4.5.orig.tar.gz.asc
 c0bf3f794954df390a7eed04762fb926ec67475b 41376 chrony_4.5-3.debian.tar.xz
Checksums-Sha256:
 19fe1d9f4664d445a69a96c71e8fdb60bcd8df24c73d1386e02287f7366ad422 620287 chrony_4.5.orig.tar.gz
 71381c92097588e139474ffca93b1261b56df1fca09a5ea2cf34f7fae0a4a379 833 chrony_4.5.orig.tar.gz.asc
 faf4c11cecc9236aee5ade068fcdf3352048ed466fb1b49310505321dd923b1c 41376 chrony_4.5-3.debian.tar.xz
Files:
 fa50d026df54f9919e6a37fae1258c61 620287 chrony_4.5.orig.tar.gz
 e2665146d965a9355bf98bd116be39d8 833 chrony_4.5.orig.tar.gz.asc
 c5a087cb3b4f2b99a51091de4647fbfd 41376 chrony_4.5-3.debian.tar.xz
Dgit: b6296a35a69012c86762826154ae0071523a0df8 debian archive/debian/4.5-3 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmZ12FEACgkQnFyZ6wW9
dQpBhggAtuLe052YymXx0NIHtXKim9uxDcTMOHEF10QQVDB+Wf0bCeIp0ucVDHTU
BbN0q1MldesBZKrePprG3Y5Xp7POxmSEzBhsUO8kZ/V59mtEI5isfA+HBAVS5bgs
Id7nRBtipj8GN5SIMmm93PUnjzyveTZTk6znkvdPvu6UE7WBnmFRhPSWT9RTEtOP
0VwG5moVTyg1mLWohWtfzkuOH0oWbeuNm+8BgQDwhaW0Ks67nxVEb8gfeDcN4gLA
fnzz/yrRZDa8R6HiqE6ySyW3sEdKB2nGW1GDxGT/F+3OJQ3Fa62K7rMMgcXIOCXA
l1hjzBoN2buBELK/MNVNNNJA5mjpQQ==
=a+QH
-----END PGP SIGNATURE-----
