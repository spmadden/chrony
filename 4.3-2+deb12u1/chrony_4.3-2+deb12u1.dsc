-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.3-2+deb12u1
Maintainer: Vincent Blut <vincent.debian@free.fr>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.6.2
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git -b debian/latest
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, dpkg-dev, ethtool, gnutls-bin, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, wget
Build-Depends: asciidoctor, bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, iproute2 [linux-any] <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], nettle-dev, pkg-config, pps-tools [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 bc7884eb4fde69478a00faee3d42092d426d57c1 593560 chrony_4.3.orig.tar.gz
 70d022ec86489cfc9b2284dcb1bd2fe6ed5f4c50 833 chrony_4.3.orig.tar.gz.asc
 44850b442d6556713dcfbaed6a3bc4e670daffee 40532 chrony_4.3-2+deb12u1.debian.tar.xz
Checksums-Sha256:
 9d0da889a865f089a5a21610ffb6713e3c9438ce303a63b49c2fb6eaff5b8804 593560 chrony_4.3.orig.tar.gz
 eb2837eb29e3ef2892ea6ae1d0615c2b83ddbaf45c8bb508dc35042feff2fc8d 833 chrony_4.3.orig.tar.gz.asc
 ea3bd27e1d5f784303c10626131ca07f70b05ace9a018fddc8bcce2bdbd3f455 40532 chrony_4.3-2+deb12u1.debian.tar.xz
Files:
 765dd8c085a0be2a52f9e9135665f0b7 593560 chrony_4.3.orig.tar.gz
 440a45cbb7bc3363a9091bc686012f63 833 chrony_4.3.orig.tar.gz.asc
 9bb35b879a881b5a62f105cfa5471f11 40532 chrony_4.3-2+deb12u1.debian.tar.xz
Dgit: 9b925106cf6e81ba9a34e8aa9341b4000fe28c47 debian archive/debian/4.3-2+deb12u1 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmRapJoACgkQnFyZ6wW9
dQpaRggAwum7pVZFYdKoMGHqdYnMf+4BcvS2znt2hl8LkI1TgLv6tw5K0wZsZHKU
CsP0QGrSYSlwOAjbRoP0PXmVzY4RJY2DXJ/0tF/GqWPtOXVBbYSdnIl3DrMc2W40
3MdzW29lt/fNmdhnoun98jRY++MWaL+hs1ppUBDpi7g6TpRfZtFU9Gnf+cILUu26
YLMzq+ynAsKt81MdQbI5kfgezrSM17RGVHnmHxAWDa94bBNtn7pZIZJZ2iuMGmu+
SB+u8HmfEB45akUAcdI2HFmWvMqN28OriM39iY15dLNcrRSvgGOPx6boukLADth8
DcLRd5+z/dFP9jjbPbwOj7PBA8SReg==
=uPAH
-----END PGP SIGNATURE-----
