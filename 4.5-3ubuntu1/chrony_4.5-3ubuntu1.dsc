-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.5-3ubuntu1
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
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
 6823844361bc46d96eb45ca9b81c959492a6a2a0 47740 chrony_4.5-3ubuntu1.debian.tar.xz
Checksums-Sha256:
 19fe1d9f4664d445a69a96c71e8fdb60bcd8df24c73d1386e02287f7366ad422 620287 chrony_4.5.orig.tar.gz
 ca62a668c0db427dd31ac08189fe7d7a9debef960e3baeb4ba23b5af6f462c4d 47740 chrony_4.5-3ubuntu1.debian.tar.xz
Files:
 fa50d026df54f9919e6a37fae1258c61 620287 chrony_4.5.orig.tar.gz
 3851704d198f3915f82e3e82a0176ad9 47740 chrony_4.5-3ubuntu1.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEiv0I09G4F7LfiYL1AaxLQINZCpgFAmaMGfgACgkQAaxLQINZ
CpiD6hAAitqeeMbI1vQE6dFIgwvxnyMopyr0W3748/dUvJXyqmRoQEmBTgRGoIan
eQixOAi8zkaq229Wuz2ZNTGjwBzXq1KMG/rhyCLKg/Bj/Ocy5o/MxR1Ikrw+6TY9
YeHYozbS/c3w571BEhDzXm3+IkttjrMPX1syltFapd1QkqYIQTmYmhj6eWUuKCO2
kVbNEnHjbBk3YBwBbrNAZjVPubvcQEVZQ3d0qSbuYEgFqf+v+MzrPLcO4RaK3VwW
WdFVPOIgyrkmip0/li5VXk8A9Mhy8Km0KAD7u6FUvi2FYKOpLlH3vwdWF6dCG194
+c4TqZB4ZmBV13XrlcA4blrw6SP2XKpVRZcrmIutdsP4umFFDW1ek/ESVoHz3oyf
dnL77Z0aGbUdO1WwCWPd5wVKx6ViocanO4Ux1PGuM+oD0yBQkfGHY2vjw46kkjp8
1djhXKdiwCjhNzkM5zqgdw5+2XvShi5Oz7hrS0pkAFID5sWChS8QgzfRstwUBU+N
/olvfCXNd2A/6kDeNxGKISxtfXhf7HmMLytU8acCRJSaJZbjLtbA/MdLkNmqwFkd
Ita3Q2w9kSxXbF7lkhen9E4GeIFtclAAnfGcgm8IqJGT8DKeujX/4kwhRDENp3oF
mJGNZE6gCK+33y9XTzYmsL7u8U+RUFQ3XUHpFIyeMLA+3UyZLlU=
=Gpz9
-----END PGP SIGNATURE-----
