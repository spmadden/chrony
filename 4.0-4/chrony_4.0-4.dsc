-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.0-4
Maintainer: Vincent Blut <vincent.debian@free.fr>
Uploaders: Joachim Wiedorn <joodebian@joonet.de>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.5.1
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, dpkg-dev, ethtool, gnutls-bin, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, wget
Build-Depends: asciidoctor (>= 1.5.3-1~), bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], net-tools <!nocheck>, nettle-dev, pkg-config, pps-tools (>= 0.20120406+g0deb9c7e-2) [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 628340e7ff3311ea5b5a6198bacde2a8b05b6ae4 546939 chrony_4.0.orig.tar.gz
 86e3a2137e4103d655cd59ed607233dbb3cd3ae2 195 chrony_4.0.orig.tar.gz.asc
 dfba4d02bc0e8ca46a237f5487850f43aa66a593 36928 chrony_4.0-4.debian.tar.xz
Checksums-Sha256:
 be27ea14c55e7a4434b2fa51d53018c7051c42fa6a3198c9aa6a1658bae0c625 546939 chrony_4.0.orig.tar.gz
 339d5f0997277092aef156b83f93f1f0d7ed2ebaf7ba48e604471c4424637b43 195 chrony_4.0.orig.tar.gz.asc
 2d4e91e95ff90fa087eb7ce97f7fcdf76d5712c6e83838ac5edf0a99eee4f051 36928 chrony_4.0-4.debian.tar.xz
Files:
 30237381f0c6ec51c19a9346d478c80e 546939 chrony_4.0.orig.tar.gz
 60bbbe25d5bb40df1562b47a8396508f 195 chrony_4.0.orig.tar.gz.asc
 7a04d674ff66a6ec392647a2251d4c9d 36928 chrony_4.0-4.debian.tar.xz
Dgit: f911ef63b4b3ed1a32e83bf07fbdc597d9e277a5 debian archive/debian/4.0-4 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmAMgRQACgkQnFyZ6wW9
dQo4qgf7B+QyhpPRhzgKktUKUJYJigaGsqikMSJPs+hpbBxWXWJQmSDN5OUu7fyR
188rQghK89K1ElgyV/O8vHEqjIqk53drBZDqzEeKxUmJA1BRsgf6eY08U7wMJcm2
prhh4GhV2XDoPggAgQc2I4nVCpA3+nZ3cMpqm+YcDgmOevIeSaxFw2246+4UUk7c
rD8/818J+Rkk4DdTJgIDbaMBtnRmy+/FIioxzOHU72FOwaucAU50vDc+gPHcMRqb
uvBCQ4ECWalZv2gNVLMcVV8122jH0OtLE6yZTcUoTOphKleaK0bLg83rN0baDoQb
zKQXiKR/hTR6d5BC026Bu8wJAMsPfA==
=okOd
-----END PGP SIGNATURE-----
