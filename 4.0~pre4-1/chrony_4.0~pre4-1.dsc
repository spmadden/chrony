-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.0~pre4-1
Maintainer: Vincent Blut <vincent.debian@free.fr>
Uploaders: Joachim Wiedorn <joodebian@joonet.de>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.5.0
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, ethtool, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, wget
Build-Depends: asciidoctor (>= 1.5.3-1~), bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], net-tools <!nocheck>, nettle-dev, pkg-config, pps-tools (>= 0.20120406+g0deb9c7e-2) [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 07a5eed9dea36c212b07686eea2af1861f7296ce 544660 chrony_4.0~pre4.orig.tar.gz
 8440c1f720bdbe39573a0fcd95ebb3e816aece26 34628 chrony_4.0~pre4-1.debian.tar.xz
Checksums-Sha256:
 9f94c7387f9f09cb9b28c1f87fde2621aec3fba485e8bbca2a1f39ba3fc8bc36 544660 chrony_4.0~pre4.orig.tar.gz
 9c2dfb2e88ead0d906e9e36a7896a26cd14ff68104a0ecb8a87c21c36e5ca351 34628 chrony_4.0~pre4-1.debian.tar.xz
Files:
 a679a0da4fe661997b1faa7125432f2a 544660 chrony_4.0~pre4.orig.tar.gz
 964058197e880fdd76c5ae6f9e8713a1 34628 chrony_4.0~pre4-1.debian.tar.xz
Dgit: 83849b5037a632f0ad8190cd26c29331ef814e6c debian archive/debian/4.0_pre4-1 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAl93gs4ACgkQnFyZ6wW9
dQpjNgf/a5JZPUZSVnsznY5tg+ZW10S8mlaqfTb0BOu7yBAOtkiv/11LCYWyUihy
RD63XQqkznRE9IapAE+rMD+5bGjQqavqwbrTi9GByidjRa+MadTsnhRPW3fRiqJD
nwNFlBJS5XYRkC7/qSyi89IJL3ffJDuCzPfzc64+HGM8UbK9tfYMwoXvGJZYOjd+
7sEjWikchh2KJdYT5nuSyiCZdMEcc31Dy0cguNCz+FnojI9gG/WS0imGoKnoTY4J
Upfa3f6UCcTIxL4uY+kdJ1rweR+KjWnEi5vKfx5obWdWPz+V2ZZG6DP0qyxXUFG+
4yfTh5qAx18bllNA3BNAWJi/VFoSnA==
=5UAH
-----END PGP SIGNATURE-----
