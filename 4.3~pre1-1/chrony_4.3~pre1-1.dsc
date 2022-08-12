-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.3~pre1-1
Maintainer: Vincent Blut <vincent.debian@free.fr>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.6.1
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git -b debian/latest
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, dpkg-dev, ethtool, gnutls-bin, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, wget
Build-Depends: asciidoctor, bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, iproute2 [linux-any] <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], nettle-dev, pkg-config, pps-tools [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 2da4b1405e9ef3ae03bb88d3ead494776b7194ff 592966 chrony_4.3~pre1.orig.tar.gz
 5a9be0ff97e9f63533b793326bbf8e80885c2bfd 39940 chrony_4.3~pre1-1.debian.tar.xz
Checksums-Sha256:
 075e5b142b8a6ccbf55cbfbc8e1453084cb8d8f3e64dd87ac65284a50453a52d 592966 chrony_4.3~pre1.orig.tar.gz
 3038368ea4e905c383c96dc0e4f9fb9cdc9be9c4abffccb8396f4c1107852fb7 39940 chrony_4.3~pre1-1.debian.tar.xz
Files:
 a11a6548a410fc53555c9a77a61ab399 592966 chrony_4.3~pre1.orig.tar.gz
 069796dd9833f86f5b93c6c079ecd6f3 39940 chrony_4.3~pre1-1.debian.tar.xz
Dgit: 46d0917807328d6d8b69c5c5b670386f173ecc0f debian archive/debian/4.3_pre1-1 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmL1bKgACgkQnFyZ6wW9
dQo5NAf/SbYUFrtWe/2pK0I2raENSuHZ4sDyKblYIX4kyoo4xUD/xmFx3bw3ffXT
PUTHQpD/iAe4tKkkUgbtS4u4G+1SL0TmWbAQNgqB+3uPTHoztf00n6iC0EyNg5im
HsBEFYTE2b8rZSRfHT/AcM/5MWhbaqmt5sxSsAoa/hjUsIadtwHopjqv2f82S7zr
GCqcr8RsRQtoH1/mQ1ow8BdyNPyvxUedl8EfyWFV+6357vQmYGe+yI4Jb7Yd3VF8
/UY6Ooc1fp6zXujdRHcnwouc3tD3OuwJw61qCcE+bjNHoPCbTN5OFvCjJTDP6MxQ
yUhMKTndlv+7hGlmzkLbNcIe3FX8LA==
=fLmt
-----END PGP SIGNATURE-----
