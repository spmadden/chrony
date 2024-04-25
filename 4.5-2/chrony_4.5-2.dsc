-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.5-2
Maintainer: Vincent Blut <vincent.debian@free.fr>
Homepage: https://chrony-project.org
Standards-Version: 4.7.0
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git -b debian/latest
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, dpkg-dev, ethtool, gnutls-bin, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, tzdata-legacy, wget
Build-Depends: asciidoctor, bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, iproute2 [linux-any] <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], nettle-dev, pkgconf, pps-tools [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 4661e5df181a9761b73caeaef2f2ab755bbe086a 620287 chrony_4.5.orig.tar.gz
 d5bd0be4ef248fa9b9a81695f6b2265c3a24db6f 833 chrony_4.5.orig.tar.gz.asc
 e5842b97e13abcb0dc07efdae31cb28785802e84 41340 chrony_4.5-2.debian.tar.xz
Checksums-Sha256:
 19fe1d9f4664d445a69a96c71e8fdb60bcd8df24c73d1386e02287f7366ad422 620287 chrony_4.5.orig.tar.gz
 71381c92097588e139474ffca93b1261b56df1fca09a5ea2cf34f7fae0a4a379 833 chrony_4.5.orig.tar.gz.asc
 c189efd7ad477d99652f780040a7161094947b11e43f043ec56fea6c8389430c 41340 chrony_4.5-2.debian.tar.xz
Files:
 fa50d026df54f9919e6a37fae1258c61 620287 chrony_4.5.orig.tar.gz
 e2665146d965a9355bf98bd116be39d8 833 chrony_4.5.orig.tar.gz.asc
 790cfd278757f2f47e792ecfc6d188ca 41340 chrony_4.5-2.debian.tar.xz
Dgit: 07fd6cff7dfbf046480342b52b2794a9ca4de27f debian archive/debian/4.5-2 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmYqdAAACgkQnFyZ6wW9
dQr7mwf+PC5UNtcOnhtChoixj4ugFuDkyTfYgbQ+4VNzxDDoEf752ISkYz17j5HU
rL8QNl68U9+Wqy6NAN5fAXdAELdtPUUu6k+myHjkhIhkrF+aauKwOQ+V8pC+ojJA
sWxdAVzg/Utxj5knPolbDm1CoT7fpty1vTr3r8Jy23ZLq56ANHQ6BSDTm8BYc5nf
wAxpeX9jQY5YEVFh9kWf/HM+UI4FSE6XhhD0MLszLh7GVWZEgIhoiI6EEs5o9679
OwUNNroMzjcU4dbjpy2nkdTvlHuADeDbzPhbjw1EmVgFKEKpIhLhpQ/oDLB7aobl
n+oeRiajRliEGSTi2MsjJ7t96uYzDQ==
=FYM3
-----END PGP SIGNATURE-----
