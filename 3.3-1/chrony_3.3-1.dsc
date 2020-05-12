-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.3-1
Maintainer: Vincent Blut <vincent.debian@free.fr>
Uploaders: Joachim Wiedorn <joodebian@joonet.de>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.1.3
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential, ca-certificates, git, iproute2, isc-dhcp-client, isc-dhcp-server, kmod
Build-Depends: debhelper (>= 11), bison, libedit-dev, libtomcrypt-dev, libcap-dev [linux-any], pps-tools (>= 0.20120406+g0deb9c7e-2) [linux-any], libseccomp-dev (>= 2.2.3-3~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el s390x x32], pkg-config, asciidoctor (>= 1.5.3-1~), dh-apparmor
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 42fbb94450e50e15aac33aabc563e052ea111f0f 443571 chrony_3.3.orig.tar.gz
 65539542ef8c20869785cdd4bc164db370418e1a 163 chrony_3.3.orig.tar.gz.asc
 16b9b4994c35157a832820af1cc6cd92941f9821 30984 chrony_3.3-1.debian.tar.xz
Checksums-Sha256:
 0d1fb2d5875032f2d5a86f3770374c87ee4c941916f64171e81f7684f2a73128 443571 chrony_3.3.orig.tar.gz
 22d18f79029cc243d3ec2cb45116c0a03786836fae239e755579005a77be8843 163 chrony_3.3.orig.tar.gz.asc
 603a3351710552254a035dfbf9c3eabe18d78235c81a97348ff7baef84bc984f 30984 chrony_3.3-1.debian.tar.xz
Files:
 81ab62cf5d60b4b3fa8cd2c1b267ffd9 443571 chrony_3.3.orig.tar.gz
 a7e8570f073d281faef50f950f9138f1 163 chrony_3.3.orig.tar.gz.asc
 cf1b78c6875608518783b8f5341a6a94 30984 chrony_3.3-1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAlrIuKkACgkQnFyZ6wW9
dQqapQf+Ihhd+rB/b/sr+4d+Gucmsnx462kTSgDOtc0N2cT12oB1Cf5ezickE+po
tac/VbJb0xxLo+QnrJkfEZjF/qs+ZQIbDEkia+81td4gWBMj9kWkWoxveicGTZK2
6Cismuf68IlOLuDL1QBfef05Vxd1wZtgcl8xKMXC8HPBBw9D6A+AvO2Iyrit5dxX
71dvDqzNa5YhIoNqgmlYAKIapNr7nOr9nd7XC/zGaXEHuJC0MPyPV27wWydg6S1a
TYnMfnYAU2AJFk+tWtPEs/02b+WFxcoWkNeb6E2G0C9lQ3ess+tDxvfuiTKFHy/u
Sl9bndwiR52XsXOY4/aMaVSK3KPBuA==
=+EUw
-----END PGP SIGNATURE-----
