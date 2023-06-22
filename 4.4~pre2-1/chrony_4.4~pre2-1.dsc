-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.4~pre2-1
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
 026411a43600b57f2e07e33a02cd590e3837239d 610157 chrony_4.4~pre2.orig.tar.gz
 5e2d1af14a947c4d76afd2c08a8866774083b577 40592 chrony_4.4~pre2-1.debian.tar.xz
Checksums-Sha256:
 4e46ca50547adaee311e6e3c0a4315ece7e78df17188e4fef5d124771cda0d05 610157 chrony_4.4~pre2.orig.tar.gz
 ec5ccaf8d92e0e17878294bde58d1eb0953ae31710bdfbd0abe061684c127179 40592 chrony_4.4~pre2-1.debian.tar.xz
Files:
 b4f818b427020c0219c1624d13cee62b 610157 chrony_4.4~pre2.orig.tar.gz
 939939b04ffd380f75efc8fdb1b6ea0d 40592 chrony_4.4~pre2-1.debian.tar.xz
Dgit: f212085dcfd0006f1d16f067c25517316d946e26 debian archive/debian/4.4_pre2-1 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmSTV2cACgkQnFyZ6wW9
dQqYQgf8CP9xmpnU7o3p4rBjAU/BX9SZu+TMq28yCYpTi+7sQ28LKEZFkT/5MC5y
gE7NnYGWaANZYlOV6JsZwGMEVGHptzEO2R9uAomWFQLIU28D3T/i+tnUEODF7oSy
gxco3HWtSdymj3tlT0nRj80oPi6HXmJg22IBX6oA6fjPQkhlzqrJiuAibUdve1mo
0v5rpvRI6N/umsLjhLM+f6cNYjBQFB+/1qAAoAj+STfMSUO2dLl9IOR4M1Mux7xs
TwQE5ktNknm3dH093xoQpeka0dqCwDO7Bt8WYKrTELMvtJbRsf4YLOUttp4wrsDz
V12VOXbXmRjZtSdzhYOSQOxH+gIGtQ==
=+UUY
-----END PGP SIGNATURE-----
