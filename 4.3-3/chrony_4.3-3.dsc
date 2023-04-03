-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.3-3
Maintainer: Vincent Blut <vincent.debian@free.fr>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.6.2
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git -b debian/latest
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, dpkg-dev, ethtool, gnutls-bin, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, tzdata-legacy, wget
Build-Depends: asciidoctor, bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, iproute2 [linux-any] <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], nettle-dev, pkg-config, pps-tools [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 bc7884eb4fde69478a00faee3d42092d426d57c1 593560 chrony_4.3.orig.tar.gz
 70d022ec86489cfc9b2284dcb1bd2fe6ed5f4c50 833 chrony_4.3.orig.tar.gz.asc
 7d9699d63dbcbec11f368fae35f6ab977c7d453a 40616 chrony_4.3-3.debian.tar.xz
Checksums-Sha256:
 9d0da889a865f089a5a21610ffb6713e3c9438ce303a63b49c2fb6eaff5b8804 593560 chrony_4.3.orig.tar.gz
 eb2837eb29e3ef2892ea6ae1d0615c2b83ddbaf45c8bb508dc35042feff2fc8d 833 chrony_4.3.orig.tar.gz.asc
 5ae7daaf2f85db0fb61937f820dd9861dd4e8efe52d6bb910508a67d9a60906f 40616 chrony_4.3-3.debian.tar.xz
Files:
 765dd8c085a0be2a52f9e9135665f0b7 593560 chrony_4.3.orig.tar.gz
 440a45cbb7bc3363a9091bc686012f63 833 chrony_4.3.orig.tar.gz.asc
 e04147d84931ed7a8a3bdf0478efc2fc 40616 chrony_4.3-3.debian.tar.xz
Dgit: 15e660d457720714c72a952fbaaadf35be471c9a debian archive/debian/4.3-3 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmQrFG0ACgkQnFyZ6wW9
dQrjVAgAum7+rKTzFW/wOkdUmQzvSweOf4BipSJVqIqVyR/aP8vI1bjaFaVq0MKP
+uLIm4bAw5xp8j8asDnDxxSVcDfu/LHvZohN2pzbnO5hVU4KaCLgR/EXn00btRp0
O3lBfjWM0dPWS62a3bjsIFJ2kHLDoBGcES2X8oq2YDnmebMd40VQ4VpHdml2IpFq
jDOzJWI7MNCvplww1P81sGRSu1MSLE6V0t31888u2AiXtF6uZnGkS041ShX3kMnX
ng2trK7On0W/hTsHyNhbm/pQXFFlLj9bR/oMxp6y5tPZYVsISP5mMJeoxn2AbugE
xYXjiE321jJuOXUbt80PiL1qtgEU+g==
=mwX7
-----END PGP SIGNATURE-----
