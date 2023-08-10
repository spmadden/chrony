-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.4-1
Maintainer: Vincent Blut <vincent.debian@free.fr>
Homepage: https://chrony-project.org
Standards-Version: 4.6.2
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git -b debian/latest
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, dpkg-dev, ethtool, gnutls-bin, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, tzdata-legacy, wget
Build-Depends: asciidoctor, bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, iproute2 [linux-any] <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], nettle-dev, pkg-config, pps-tools [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 42135da969d0179309ea2baff72e9449584f67ef 612094 chrony_4.4.orig.tar.gz
 024fb599f223c8fcc66f4a75378c6e45577b022c 833 chrony_4.4.orig.tar.gz.asc
 fea49ad3e83d3890877f6758cb8c7e683f7b1c02 40832 chrony_4.4-1.debian.tar.xz
Checksums-Sha256:
 eafb07e6daf92b142200f478856dfed6efc9ea2d146eeded5edcb09b93127088 612094 chrony_4.4.orig.tar.gz
 a42a0914a97226a884d900d67fa0208c60cc9166ceb38745e6afca1fcc6d53af 833 chrony_4.4.orig.tar.gz.asc
 460fea2b68484a5636b35f01a9a4503458f32de34784da79e7610225a0c22150 40832 chrony_4.4-1.debian.tar.xz
Files:
 f9876c57f9385c193c806ad8d5c6aec7 612094 chrony_4.4.orig.tar.gz
 bccc80110abfbd5e1657f3bb8343e9ac 833 chrony_4.4.orig.tar.gz.asc
 bada1737728056ab6dca2ec3ff5e8393 40832 chrony_4.4-1.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmTT8OEACgkQnFyZ6wW9
dQpFvwf+MhbKo0VvcK/2QDRmGT4aKIFaO/R7l8ItNc+zt+wilsnusl8v/Tspoatg
LU4bPkAIhOdfXk/l4pzS3cIWCTQ/7mqfkxBZDeckqLORVJng/AsSidWRiJNaHyxY
sCWaPYUbbI9h8kDA9+yhBkD9BYai5/BUAs2oCx29Cs6Zp2HQIhCQ3yCfDz0D30g1
9YJmFjcXwBEgwwB97+91E94rrbA6GI48ly48CSImU0bWtQb7unBP73M9SCp5ZS3n
cXx6tTKAYMee+cAE455/C0Z1fcCVGZcEYp8dGmhyLPPjNrerjk6sLPRXoOwmLpiJ
C/vZMJegVEwUR+IEGa9Yjl9LklcSlQ==
=ifg0
-----END PGP SIGNATURE-----
