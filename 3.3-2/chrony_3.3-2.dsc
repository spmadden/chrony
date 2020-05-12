-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.3-2
Maintainer: Vincent Blut <vincent.debian@free.fr>
Uploaders: Joachim Wiedorn <joodebian@joonet.de>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.1.4
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential, ca-certificates, git, iproute2, isc-dhcp-client, isc-dhcp-server, kmod
Build-Depends: debhelper (>= 11), bison, libedit-dev, libcap-dev [linux-any], pps-tools (>= 0.20120406+g0deb9c7e-2) [linux-any], libseccomp-dev (>= 2.2.3-3~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el s390x x32], pkg-config, asciidoctor (>= 1.5.3-1~), dh-apparmor, nettle-dev
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 42fbb94450e50e15aac33aabc563e052ea111f0f 443571 chrony_3.3.orig.tar.gz
 65539542ef8c20869785cdd4bc164db370418e1a 163 chrony_3.3.orig.tar.gz.asc
 97518aae02e458de6caba7a3480519c1a120a8da 31372 chrony_3.3-2.debian.tar.xz
Checksums-Sha256:
 0d1fb2d5875032f2d5a86f3770374c87ee4c941916f64171e81f7684f2a73128 443571 chrony_3.3.orig.tar.gz
 22d18f79029cc243d3ec2cb45116c0a03786836fae239e755579005a77be8843 163 chrony_3.3.orig.tar.gz.asc
 4413db3e5faa6cbe2f69efcf261dd5f2f37a9f79ea2bfb9accb27e759b3719b0 31372 chrony_3.3-2.debian.tar.xz
Files:
 81ab62cf5d60b4b3fa8cd2c1b267ffd9 443571 chrony_3.3.orig.tar.gz
 a7e8570f073d281faef50f950f9138f1 163 chrony_3.3.orig.tar.gz.asc
 6e406682ac3d577ebf2e6e745e466169 31372 chrony_3.3-2.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAlr6xPEACgkQnFyZ6wW9
dQpdHwgAzF/FYP15KGr5pE/f3tLfof1PtBiR+pGLiMErmA+jRj+uo84BSlhYfMDv
n4sL188AQltT162KLSj2jAMCubmHhHb7VwCHFujpqqYZx9ofZHXX82Wae1iXnvw1
iyi+DvuvUTXPkhnAWiLIekxHDElY26IHW6it8PrcPZz+peK01hMn4CahP7xWII62
FOuHoDlPSQIwZVMsF/VSdeO029VhF9cL5htlGDYdWQWy9bt5T/3x6yd+IMQ7IpOV
5EdsiZbdRy+/jbZYazspgua1cASUwoYc4NhrVNoTNdnD3hzSzDr78wQzyHs7xpc+
4Y9B/m5zdBAKzYlOxkqaatv5FidUpQ==
=6iIQ
-----END PGP SIGNATURE-----
