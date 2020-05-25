-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.5-9ubuntu1
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Joachim Wiedorn <joodebian@joonet.de>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.5.0
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, ethtool, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, wget
Build-Depends: asciidoctor (>= 1.5.3-1~), bison, debhelper-compat (= 12), dh-apparmor, libcap-dev [linux-any], libedit-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], net-tools <!nocheck>, nettle-dev, pkg-config, pps-tools (>= 0.20120406+g0deb9c7e-2) [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 79e9aeace143550300387a99f17bff04b45673f7 458226 chrony_3.5.orig.tar.gz
 59d1948c1628cd83f7dc9bbe675e194e5e870a37 41800 chrony_3.5-9ubuntu1.debian.tar.xz
Checksums-Sha256:
 4e02795b1260a4ec51e6ace84149036305cc9fc340e65edb9f8452aa611339b5 458226 chrony_3.5.orig.tar.gz
 8c30c7a0518024978fbb6142e382a5b915facff53a402724d12c0f4159bf9e50 41800 chrony_3.5-9ubuntu1.debian.tar.xz
Files:
 5f66338bc940a9b51eede8f391e7bed3 458226 chrony_3.5.orig.tar.gz
 4d15cc31a2aca0b6fce4018d20a72153 41800 chrony_3.5-9ubuntu1.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEktYY9mjyL47YC+71uj4pM4KAskIFAl7LwDAACgkQuj4pM4KA
skK2bw//f2pE4Vj4zpEr8Bo/DjMe9ZnXxb9y92Xe9g1bXTsETloA6DCgWfXJ97VV
x8REGWh0RlaxmK7ntJOERIEumKWQOjSc5BJsLzcHbSqZcEuWeese2nSMz/Tfet9v
eZytXKPF6Kb3I7Gv/SZ5DmWCRcDbmkORXJ05l4MmQA85Ssl3WJG23fddG4c6gX2v
fUUJbzTHrHXyL1lUKj6lFWjz4Z4/eAhYunnNDkmxqTgfrb0eT4+nfbAyb/DJJNEJ
vDuJS8zneCw0eNrUZOuMqTnqA6e1h/nWSV4wL1nHueJZs7CJicZ6TaMXDjmJh2Hn
kWlE3CYgfz8uH6OB7MwrJ39s+4l9JHNqutdZP3oaFQh+5jLlzBTfBOV+lOsPjgJF
9d8gYvA1Vbvj32YRPITxJ33f2mM5hFvvRsOBM8H/vqVqWdCjt1AHJrrvLEgCuRb2
iuoEzxicyTAw7NOPA0Z/28SiEnmSsq3isEB11FwDEpS2wioyEA47A97CjDB7ML6Q
Gj6iAQJAb2YoAGKQPk+q7kv7l0foeJFI5gXU2inHYnZ/x4eSEn4iO1Qc1F1H2sKJ
rb1XsVOZznpkHcymmJlm4TIVZH9zNq9DEs3PMjBCRuO4WOmjV90eUyVa4H43ojyS
aaf3awiF/hi82Oj52557U2lyVcwQ7baGa15vQJU3kPYFBd9fZgk=
=Lh+P
-----END PGP SIGNATURE-----
