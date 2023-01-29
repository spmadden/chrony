-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.3-2
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
 1c89111be2ffbf930d28cb8f442d53589837b854 40416 chrony_4.3-2.debian.tar.xz
Checksums-Sha256:
 9d0da889a865f089a5a21610ffb6713e3c9438ce303a63b49c2fb6eaff5b8804 593560 chrony_4.3.orig.tar.gz
 eb2837eb29e3ef2892ea6ae1d0615c2b83ddbaf45c8bb508dc35042feff2fc8d 833 chrony_4.3.orig.tar.gz.asc
 3d3004ad6d8cc4775f3120842f14d9e2ca7448a370a8e24b22955b70851479c9 40416 chrony_4.3-2.debian.tar.xz
Files:
 765dd8c085a0be2a52f9e9135665f0b7 593560 chrony_4.3.orig.tar.gz
 440a45cbb7bc3363a9091bc686012f63 833 chrony_4.3.orig.tar.gz.asc
 1322e3183a66797d2a9f6d0e3bdb6971 40416 chrony_4.3-2.debian.tar.xz
Dgit: ba8e2cd20c485ebc82b8d7271ceeea8eafa670d2 debian archive/debian/4.3-2 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmPVk2UACgkQnFyZ6wW9
dQq7NQf9GuzBO4PfrsA1FQjBMCAWTj3qYbNkRU+cW2sBA1xbTwFxSXR1EOz1Ybos
Jqdy0DlJRSPS+rKNX8M7V2usRJF2RheBT9gbv7dZdVniNWsypUpnYBASLSRtZAXg
yOXSn62Kc0E0HQr7eXlI/zq7MXwXRx1DXMMQ71LLrFyyH+JquVioR/Wlngp62tpo
psIC6DCE2VxLdfFlby++dxnaSatTU2OnU9Yr2s9Xknwiii1w+xhyb+i95LySEmuZ
PX0z9ewzJN6MO5MNi0yRJfAYQNJ4mQp8IX98PnhxBh8ZYKnarmFzdsErDxdcmof3
Ox589oRnzU3JrpB1hBzujZ9wO4aJHQ==
=K+QX
-----END PGP SIGNATURE-----
