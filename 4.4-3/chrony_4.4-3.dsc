-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.4-3
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
 3548f3d11b18b58ba9d529872873ad78ebdeb4a0 40916 chrony_4.4-3.debian.tar.xz
Checksums-Sha256:
 eafb07e6daf92b142200f478856dfed6efc9ea2d146eeded5edcb09b93127088 612094 chrony_4.4.orig.tar.gz
 a42a0914a97226a884d900d67fa0208c60cc9166ceb38745e6afca1fcc6d53af 833 chrony_4.4.orig.tar.gz.asc
 f0caa71bd2a920bf3437a992b55e9edb5e4f16d7723f9fd203d6eb3217276ee0 40916 chrony_4.4-3.debian.tar.xz
Files:
 f9876c57f9385c193c806ad8d5c6aec7 612094 chrony_4.4.orig.tar.gz
 bccc80110abfbd5e1657f3bb8343e9ac 833 chrony_4.4.orig.tar.gz.asc
 6d9fae910857049ba2955dcfcec1b76a 40916 chrony_4.4-3.debian.tar.xz
Dgit: 5d417654017b08221f485f252e1713bad3e53bda debian archive/debian/4.4-3 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmUy2PAACgkQnFyZ6wW9
dQqZ2gf/RoVHI4gN9rbFNm1y01XaUpoSBS2aAoaim7RPLwpRIu/xpG1/eX+SFMQl
vPpdRVOYVfQ/4QZbZ7J9B27E2KAThwVxfsOmBmjLAZZ1how0z+ChRl9CLCoEeHnT
FKxNCuXlGJLqdtEojIJzeIMBcE/qO4iBwDq85ZXXcMOHXwgFAowQk41HHRE96K8e
4E3NWdSQWdt7KNbHQrBvlRBgZVZsXG/AV/YcvszEv75acd3AW9gIHNZPXkJLv6L8
w4Ny6unpuObQQOk3yQ/FzzZNau8li87Yb+z6KAOYAKD3+CR9wWn8he3wPIYzquV+
/Xh4g7YPCMu5ZTBZ5jnMkaAKoheR7g==
=CnYy
-----END PGP SIGNATURE-----
