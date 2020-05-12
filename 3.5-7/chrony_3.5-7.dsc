-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.5-7
Maintainer: Vincent Blut <vincent.debian@free.fr>
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
 064de66cbc43a6ea64ad269111b499e57adbb742 163 chrony_3.5.orig.tar.gz.asc
 5f213d41764ce6d59139edd60e3a528b6036d5f8 36332 chrony_3.5-7.debian.tar.xz
Checksums-Sha256:
 4e02795b1260a4ec51e6ace84149036305cc9fc340e65edb9f8452aa611339b5 458226 chrony_3.5.orig.tar.gz
 7d9423677fa33cbca4f05649e564bc52e4ef3f00c2296c076318e96ebaea1c74 163 chrony_3.5.orig.tar.gz.asc
 413bf5aa9ff97afea5a86899685fd5a239866b287df723ba77cb1df113400543 36332 chrony_3.5-7.debian.tar.xz
Files:
 5f66338bc940a9b51eede8f391e7bed3 458226 chrony_3.5.orig.tar.gz
 ce3107a4dfa6eae979440b9054c16f2b 163 chrony_3.5.orig.tar.gz.asc
 f43c486be49d225a943efcf0422263d5 36332 chrony_3.5-7.debian.tar.xz
Dgit: 92cb5860d98a0dd740279b49bd536ec3563414c6 debian archive/debian/3.5-7 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAl5xRXkACgkQnFyZ6wW9
dQpYiwgAvQBSDhDpjbJ3tS0Tsk8BlPZbgaMZaEyQQG/siCzZhySdyHhgn6wLAfkK
+7IAcXeyyCnKt8sGn/PIvXO3Wq/XVo28zoBBVSOOY8Sv20HRagXPnqnLUUKnRLop
EEwTS1oXRE5wCrkapDTB9GRS/Gbua7IEBFI1hI1954aGMzJY+aTXTqx2KONiCEhV
GrOFDuJ59hr1p7R9qrpyJYlO0RaJM1H/3pZKKfC/AQAJn4OFiY0QRLdeMOuAezdW
m+0XkKmWFEfYHQ2Xzo73UlBEGToycw084mWCyYEC6eRnWmpKa918vNZalI0J58FP
EjUqtfjpjAwjYdeoMPdMPZBzklVWvg==
=rtrt
-----END PGP SIGNATURE-----
