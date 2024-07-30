-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.6~pre1-1
Maintainer: Vincent Blut <vincent.debian@free.fr>
Homepage: https://chrony-project.org
Standards-Version: 4.7.0
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git -b debian/latest
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, dpkg-dev, ethtool, gnutls-bin, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, wget
Build-Depends: asciidoctor, bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, iproute2 [linux-any] <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], nettle-dev, pkgconf, pps-tools [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 029daeeb0b6d96dfaaca87f3cc55f39321db3d30 629066 chrony_4.6~pre1.orig.tar.gz
 ed7ee9da4b29083c08e3e9511c774c2e20fdb137 833 chrony_4.6~pre1.orig.tar.gz.asc
 af00f647d55cbcbe36d2064269b2831990da75cc 41508 chrony_4.6~pre1-1.debian.tar.xz
Checksums-Sha256:
 b155188b0fcf396cc48380e1793a851a2a93fafcfdf4e58ea13a4a761bed59ee 629066 chrony_4.6~pre1.orig.tar.gz
 fe947488de422d54d8c1257dbea86e3dbcee116d589d6ca13906760587b04bd0 833 chrony_4.6~pre1.orig.tar.gz.asc
 573debae8c6df0890c2aa9103edb370064c26616f060b20759bba66a3b4187e5 41508 chrony_4.6~pre1-1.debian.tar.xz
Files:
 6b51290ad9d2040d3e077df07039bbf3 629066 chrony_4.6~pre1.orig.tar.gz
 d1f463fc9a445523ca537a1181a23438 833 chrony_4.6~pre1.orig.tar.gz.asc
 e26752e0cedf8af0da4f68542e8dc295 41508 chrony_4.6~pre1-1.debian.tar.xz
Dgit: 353ba82f63360888903432679d46d98851bda10c debian archive/debian/4.6_pre1-1 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmapJXQACgkQnFyZ6wW9
dQoVrAf/SfJSFcAm4eWw5bIKbrYuGcuGwAUsgjSadi45kRe1ny4ppwB1ZdJXdurV
44ttDrfvqMOQpkd+hMyT358nIl/87OtE6NNTL4s0tiDDRdHOR32/0Z2Ui2zsdbLF
vIVpYT6PAIH8kKtbz0mev4JAh62pk69/yLD6NheCSng3Iii8tKeMw/DUpkMUzWIr
JTwPiICfojYjtRp8r67krLQG/T6brJhQksPJWkXOpyyp65woPpQFW5v2u+t9aANr
CC1PMAmo47f89m07w9lUXxSOtvnqp3XcxGenssSl7JvOvCxz3po1P6PLGmI2gAae
W+fWd7RtNC6284Q4PChHpzQydg5cSA==
=4K/f
-----END PGP SIGNATURE-----
