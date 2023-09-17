-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.4-2
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
 56b4984236472a73cddd382a35de0acb324a5e39 40816 chrony_4.4-2.debian.tar.xz
Checksums-Sha256:
 eafb07e6daf92b142200f478856dfed6efc9ea2d146eeded5edcb09b93127088 612094 chrony_4.4.orig.tar.gz
 a42a0914a97226a884d900d67fa0208c60cc9166ceb38745e6afca1fcc6d53af 833 chrony_4.4.orig.tar.gz.asc
 cce0654567296c9f161d5353026e42fa94ff001aed452c5b613e094614520730 40816 chrony_4.4-2.debian.tar.xz
Files:
 f9876c57f9385c193c806ad8d5c6aec7 612094 chrony_4.4.orig.tar.gz
 bccc80110abfbd5e1657f3bb8343e9ac 833 chrony_4.4.orig.tar.gz.asc
 ae8269a226d2dd5b24d014345a895bdb 40816 chrony_4.4-2.debian.tar.xz
Dgit: 8bbba617c72591964ac13e42b0d8c8de493b6086 debian archive/debian/4.4-2 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmUHQLgACgkQnFyZ6wW9
dQos5Qf+MMD62ZISbn5VIcrt3zIWtjG+RTFVyly/rb1I7fUS0pztAeXf0wkChH62
zCGEg7Gt6rw+LNfOBK1mwljYN/cujoW1PM7mHzwXJeizyfOAET10zTNNhbFPHSbz
MoTpd+Ni3fZ7T3bFTqpii3PI3omE2rpaocsysns0ldywt+GrqecrR/XhlZiDMmJR
4dItW/X9vmaYc8GAK4wKdmw/k7AbdPP5eBRAguFCigkYYMbZDNRsyn94WVxiL8tj
vn0sNlBCS+xtywrYVjNWsaAJYwblBmDX/rRzrsVzDt3ahLvAnOprWbH35skq1rLM
7uW2CWB++WaEVQ3Q9r4+e4T8YvNz9w==
=98a7
-----END PGP SIGNATURE-----
