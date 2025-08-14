-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.8~pre1-1
Maintainer: Vincent Blut <vincent.debian@free.fr>
Homepage: https://chrony-project.org
Standards-Version: 4.7.2
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git -b debian/latest
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, dpkg-dev, ethtool, gnutls-bin, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, wget
Build-Depends: asciidoctor, bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, iproute2 [linux-any] <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.5.5-2~) [amd64 arm64 armel armhf hppa i386 loong64 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], nettle-dev, pkgconf, pps-tools [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 bf585a4f11bde82b9ab8599894b030b072591356 649314 chrony_4.8~pre1.orig.tar.gz
 ef11426639139b4955ad24ecda33a3f084920ad2 833 chrony_4.8~pre1.orig.tar.gz.asc
 3611b451e88882e406321295f9ae76b990404dcc 42596 chrony_4.8~pre1-1.debian.tar.xz
Checksums-Sha256:
 affb1c6c432e4afc3035ef1a78f99914c659d2ec15a13462eab4d892e60c828d 649314 chrony_4.8~pre1.orig.tar.gz
 0b9a298106b68ee834745db81af7b55d4e5a852cd6c619027f713746239610a2 833 chrony_4.8~pre1.orig.tar.gz.asc
 0faac861991acf5e9e21d0c47d9790661de1928d25649afaf7d86428b4cd923e 42596 chrony_4.8~pre1-1.debian.tar.xz
Files:
 71f1ebebecc1b93b552d9ee9acf15c36 649314 chrony_4.8~pre1.orig.tar.gz
 84dd97be545502ce952ecdc28ef9eb06 833 chrony_4.8~pre1.orig.tar.gz.asc
 7b72b2d1137da3fb5eefc0d6891a41b5 42596 chrony_4.8~pre1-1.debian.tar.xz
Dgit: cbfa7a93a44967f20ec69b05fe3f87325a60f168 debian archive/debian/4.8_pre1-1 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEG5OTVaxMNcrfvXOcBqMo4AxqzhUFAmieGVsACgkQBqMo4Axq
zhWa3Q//SU/DDEKmk1ZzliK5h7KBQEikN4mYaQT7NrOfMIeV+Xz8ENoTBoFyMzRv
Pwm6zrW81UlobucHsHCbznsHN1essEfg2zNAMlO7S/sys6PIltcRLOLozILq6GfZ
UBxyg49srYRQeWdingzjr5mQDiFNkdtQh/EcyAYmRfjLzDMFF5XKXP5cTSU1yMjD
UU8sxDjTUjDMehBPLA4O8FTwtgLR/pjWt4bQYDxoNXnEORNHNp81a5ELg2fJh20C
R6jNqVX8gmuXZc7OOhcSY7A2Df4NSfty7w8CjZvCbvjl81l4ZeuAtu5yiiUZislZ
J9VdUbaADNA3YDGLrpA327RkN/4wPzF0/KfHqqSKV7kWIJghRK6MlaWCda2FjYuY
NTuRuZUFRT0zng6b7YqulNpNMo00c6LLV8Bt2E/+oqj3hPz4muzMPQDO2bXqPYMa
pwSVVc1sxevnJhFcyIq5ju+xHiMs6anuezG8LY1sUCfA5m6+964p9S4fbrMtFRFq
9+pcyURNemDMYvdmn10vyg2WLsRLJ0H7TTiUP8q0tVXBb4TYGy9Xao7wt1lGsHNe
29rcG3D/FpL2n/jD/W0+6Uda5LXog18XELwnKjsvuXW3ie5XhSbFh05lZoIU3vOX
/9opQnYjY97y3dMi556D7/sKjTTl5FK3SIC9Z3isAJKAu4cIfTo=
=ICsr
-----END PGP SIGNATURE-----
