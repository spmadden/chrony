-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.0-8+deb11u1
Maintainer: Vincent Blut <vincent.debian@free.fr>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.5.1
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git -b debian/bullseye
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, dpkg-dev, ethtool, gnutls-bin, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, wget
Build-Depends: asciidoctor (>= 1.5.3-1~), bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], net-tools <!nocheck>, nettle-dev, pkg-config, pps-tools (>= 0.20120406+g0deb9c7e-2) [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 628340e7ff3311ea5b5a6198bacde2a8b05b6ae4 546939 chrony_4.0.orig.tar.gz
 86e3a2137e4103d655cd59ed607233dbb3cd3ae2 195 chrony_4.0.orig.tar.gz.asc
 7f79afa99f10861cd6d532ee89f74a6d1aa22c79 39044 chrony_4.0-8+deb11u1.debian.tar.xz
Checksums-Sha256:
 be27ea14c55e7a4434b2fa51d53018c7051c42fa6a3198c9aa6a1658bae0c625 546939 chrony_4.0.orig.tar.gz
 339d5f0997277092aef156b83f93f1f0d7ed2ebaf7ba48e604471c4424637b43 195 chrony_4.0.orig.tar.gz.asc
 ea2ad8f8d6a8bc82eeaf7ecfdcd68798d14452262ba09fdc3cd5b2e6cf65f105 39044 chrony_4.0-8+deb11u1.debian.tar.xz
Files:
 30237381f0c6ec51c19a9346d478c80e 546939 chrony_4.0.orig.tar.gz
 60bbbe25d5bb40df1562b47a8396508f 195 chrony_4.0.orig.tar.gz.asc
 28ee3845cf0e3bb1c72256dc5234ed4c 39044 chrony_4.0-8+deb11u1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmGrufIACgkQnFyZ6wW9
dQqj/wf7BOEMVeciHXujg7Iv6yav0Ubqfv8zMapJjM58rO4RQht8FdRnBF51aHaT
A6YIdgH4t5Du4VSMd3wpPKs8Dq9KzGiYlvnKYPL1O/Oly1JCDS6c9hQ+trmyNc8L
AAAzUufov/U44bBh3T1085UQUhUqR0QbZkXuAO9142FDPRJjvrbl0zdSO8tRYVg+
kkxMzRXu63ApwmH3BVOsac9yEG106+nR2WzdQRKPMSncqkt3/O3JidVKPQU+fHNl
KhP0RVDXCtRpQxGA2+36kl9jqIC2zuTPqXCjfks45N+M1CiKyutsXmi5NdWV7yXx
NLjXyqWgeZXTJjP2YIU4AMBXCcWuUg==
=xZ+f
-----END PGP SIGNATURE-----
