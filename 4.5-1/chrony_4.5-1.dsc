-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.5-1
Maintainer: Vincent Blut <vincent.debian@free.fr>
Homepage: https://chrony-project.org
Standards-Version: 4.6.2
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git -b debian/latest
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, dpkg-dev, ethtool, gnutls-bin, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, tzdata-legacy, wget
Build-Depends: asciidoctor, bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, iproute2 [linux-any] <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], nettle-dev, pkg-config, pps-tools [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 4661e5df181a9761b73caeaef2f2ab755bbe086a 620287 chrony_4.5.orig.tar.gz
 d5bd0be4ef248fa9b9a81695f6b2265c3a24db6f 833 chrony_4.5.orig.tar.gz.asc
 88bfeaee92ddac334de214c743583795f2c3e33a 40992 chrony_4.5-1.debian.tar.xz
Checksums-Sha256:
 19fe1d9f4664d445a69a96c71e8fdb60bcd8df24c73d1386e02287f7366ad422 620287 chrony_4.5.orig.tar.gz
 71381c92097588e139474ffca93b1261b56df1fca09a5ea2cf34f7fae0a4a379 833 chrony_4.5.orig.tar.gz.asc
 4c6cc61d2b29cab79f9c2446cd96435c57ae5b7dab0a14e57db7046cfb315c44 40992 chrony_4.5-1.debian.tar.xz
Files:
 fa50d026df54f9919e6a37fae1258c61 620287 chrony_4.5.orig.tar.gz
 e2665146d965a9355bf98bd116be39d8 833 chrony_4.5.orig.tar.gz.asc
 39245888de8c2ca7695b5ae90c81c06f 40992 chrony_4.5-1.debian.tar.xz
Dgit: 990f01f6b571178a98478c1b460443d26f916361 debian archive/debian/4.5-1 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmVwzbMACgkQnFyZ6wW9
dQrmIwgAuTkZdF5mIA2azO2e2QnZcxlCoI6r5H9oji4RXZe7UG8k6YPFIYTZPdjO
zxm0SlGeOB7Cd3QbPKlTUALPMIEBo0XRkuI/fMl1ikWDrMJ8MVYJLjxfe/BgDdSL
+MCP2iYCkd4Ik/wZeSj4q+mw2kQM+KfuolvPTYmJF4tVsCPV+cD/+cv9ALK7NuGx
BqcPIypEmxuP7F4Uns2PDLdkFlJqETULRnMZt86jKynjuajFA09HcUwGPKPi5ELf
MSYoAd9TukTb038sfj0ktCShfDk/qmIFdn8b/Rheuo+ed5IReS8hBCGkxG8tuZXz
xmKgemb9KYm6BW5z7+Uo672KbhRwGA==
=QoF9
-----END PGP SIGNATURE-----
