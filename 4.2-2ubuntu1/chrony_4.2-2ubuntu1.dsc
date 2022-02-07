-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.2-2ubuntu1
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.6.0
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git -b debian/latest
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, dpkg-dev, ethtool, gnutls-bin, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, wget
Build-Depends: asciidoctor, bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, iproute2 [linux-any] <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], nettle-dev, pkg-config, pps-tools [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 0f5de043b395311a58bcf4be9800f7118afd5f59 578411 chrony_4.2.orig.tar.gz
 2275003df15771e051b56d425082aeeece2ae6e8 45940 chrony_4.2-2ubuntu1.debian.tar.xz
Checksums-Sha256:
 273f9fd15c328ed6f3a5f6ba6baec35a421a34a73bb725605329b1712048db9a 578411 chrony_4.2.orig.tar.gz
 65dc8eb61549de3e0b839fcc5ffa4408f5da6be266f0344e6049942452d01601 45940 chrony_4.2-2ubuntu1.debian.tar.xz
Files:
 07282f8e76a4399d6c17009bb6345614 578411 chrony_4.2.orig.tar.gz
 16722871ba8b0d103c958fdfedfec2cf 45940 chrony_4.2-2ubuntu1.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEktYY9mjyL47YC+71uj4pM4KAskIFAmIBCC0ACgkQuj4pM4KA
skL1MxAAjO6Cu0O08b0UiTVdsq0lyLjmw223IGmez7dXivl8psFPoQctqgUdkqVs
HmwjIaC6pUEFTWtgcx76kXjS3w1BBpMVVYOSrBcVtUX6JyzxH3ShlDoNIVemoCL2
219y3EDmeQp+kI1MghQ8VlGJepES+T35ocE47iH9Uh4wrTV1bOlYWetRuxlpAx5q
OmQZG+9rRFhdlJHS1TLkui0U2eyIE1QbWwTal0jPBV6pKsbU8exm9fQlCPzN0wdH
WYHseYmJEYQ3qlH9ZwySiMZpxDqno+p7KXyFkXBeKCvlliqkBlI3gaoLp1zE5QcT
85Imi4+IZrsY4nEhCD6SCwPe4KY/ibmxuRf8m/9TViZenqcqNSwwPpuCvqnvQB8T
oVdpaU5jJkkcdEvgFRearHb5ylWyJpLVMF4wF5Wm0Xvl0p9PVb7B4gA1xHlFrqj8
Iqz0TexvzOqk+GrmoPUxboW8TFM833RatCavzD0kI4xYzTHqpvgXDInJkd3Fks+U
GpXYIxk7io8SDIP8pA6L//sNV1l4Gez0vLGYE/SFqyedjb0mufaqdvj24OK4GX4/
LVjWpf0dJmKqr1sm6AR/hmgwdSjm0BE9q6gADjgOOyVH7v/L/P46VZDKREjubMze
P10ReosSstLAVUco5dXsSkG2DQ6k2Cu4U0Hz8GlKLLiONoODsxg=
=zQ7K
-----END PGP SIGNATURE-----
