-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.0~pre4-2
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
 6cc68061c0d2cc6c49166a83c745fff3dd19f5be 34744 chrony_4.0~pre4-2.debian.tar.xz
Checksums-Sha256:
 9f94c7387f9f09cb9b28c1f87fde2621aec3fba485e8bbca2a1f39ba3fc8bc36 544660 chrony_4.0~pre4.orig.tar.gz
 b362446fa3c5d9a5c883a60b90674c7a59cbf4b14173205563a121eb0c5ce5fb 34744 chrony_4.0~pre4-2.debian.tar.xz
Files:
 a679a0da4fe661997b1faa7125432f2a 544660 chrony_4.0~pre4.orig.tar.gz
 40e085b7c404d389ecea7e0deed52c88 34744 chrony_4.0~pre4-2.debian.tar.xz
Dgit: 2a43e930848f8d1f5b660b9ace65f24e0a9cf102 debian archive/debian/4.0_pre4-2 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAl94ftgACgkQnFyZ6wW9
dQo5fQf+N8ue28FdCGPFWkdCZfxKOBPiS7Dq/ghOfCOl+sv9sZf/i4OGzvxVngol
vaS9Nz/0IARj7pRQQCBlWXx28h86A+QwCzbeBAi6PsTfOF9xPCyYUxpus8drAGtR
PqrarH5/+8SiLaIsgMd/5h9+mKmfH6vtNeiMq/rrtYa0cMinSmT/fjRIASu4YSax
KQxF7AmOV42tqScUKrgy4OGtpB5H0TzgtmMF6F6eDinxGoA6hzdtDHf8wNM0Qcrj
+Z1cUBKpuyQsTfsJJumOYxaU9BQNm97a28mkY4cUS3hT5OrVj+RYM7STEGoaTqxS
FvOHGCR21CX7DLF3KggxT9KJV6IynA==
=4T3H
-----END PGP SIGNATURE-----
