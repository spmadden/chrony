-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.7-2
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
 7a59427bb96df4b1d443cf6eb5bea9e95a6b071f 644610 chrony_4.7.orig.tar.gz
 3c19de582bfc9cf216ac359477cc58c8febaae7a 833 chrony_4.7.orig.tar.gz.asc
 4d90bd4cfbab0d1adb6c1a96b02425c72be5ff1a 42492 chrony_4.7-2.debian.tar.xz
Checksums-Sha256:
 c0de41a8c051e5d32b101b5f7014b98ca978b18e592f30ce6840b6d4602d947b 644610 chrony_4.7.orig.tar.gz
 ac3ca0847891d91551d53ba6adad257e0261bc6fc4f72175173bef3c6855411c 833 chrony_4.7.orig.tar.gz.asc
 18b56d6ef224b21c614a9e69eb9dd56d33c52cf1c20b0b926d403d1a4850d525 42492 chrony_4.7-2.debian.tar.xz
Files:
 a1ab6e972527a9cbf6bf862679352ed3 644610 chrony_4.7.orig.tar.gz
 c4fc703ea91ef6fe12fc892b29950821 833 chrony_4.7.orig.tar.gz.asc
 94d376592d6c68978f6b3d1e1a50735e 42492 chrony_4.7-2.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEG5OTVaxMNcrfvXOcBqMo4AxqzhUFAmiY5OMACgkQBqMo4Axq
zhWULRAAo3Mevx3iy2tG2ABZ5e2yzs2c2jvPTSETe1loVXt+Ji+0rUtdiBaJS2uI
3kyj1q05EHvF61yC4ICPaMDOIsVHXzBjnKiHSdyf9s2jPtDdDAZNWMAraB74gou0
tZhLvVl+MZcNUh2DO8OFdZJMQXbtdrRhoCZvzcmHhHXJUxbUrXf156TGxutXcRpH
fimbBHTixIxRTu4ph7bOTg8dQbTh+WTmHR23ZbNCxD1BG3mLwoFhICDl6Nutpfke
pkxH80EfMwTsbXRy/+vOAOSyo1YWsWQYF5YQgotG+sxdbpgNypdTeke8Qt3nb9JT
fXhnldUcG+nbvmYDDJt01oDkulEg0E4AAvjHFi7KxCqV7ueSgOZfRoicvjBQhss3
M87y/MYWA98VFkPq+awVHbTwY8uADNB4gUh7QtzOvU9GW1ohOuhot6FZsX/KeZrD
nsxczsmZXYNZbQwu8r8V4yBx/urkg6KBStOenE1zzdL63F0ZHrOO3975GWlmVVvE
1z4XIDgqYgtDoXXgG3VTYgLNXUFD/slWtIlOKocn0vt9xsOIolKciNbYSta53nPF
R/+aRRxG4WO4BQRm1bEquHzYXCRn+QZxN5OSTmzjpJw4K94Tff9LWl6qKRcUMxLk
KkVOJzyKJamFxhiF2ScPfsr9ce+k5Jn1z+1g20Z6mLnlvw5sTnI=
=hBB7
-----END PGP SIGNATURE-----
