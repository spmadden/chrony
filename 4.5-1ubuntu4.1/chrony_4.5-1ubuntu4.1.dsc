-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.5-1ubuntu4.1
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
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
 4661e5df181a9761b73caeaef2f2ab755bbe086a 620287 chrony_4.5.orig.tar.gz
 2ab4ce315f9b7238202242e7b1da8e9d7dada9a4 47396 chrony_4.5-1ubuntu4.1.debian.tar.xz
Checksums-Sha256:
 19fe1d9f4664d445a69a96c71e8fdb60bcd8df24c73d1386e02287f7366ad422 620287 chrony_4.5.orig.tar.gz
 dcf6ca922905756967221d474191a55d6d7aa093a494518d4fef0889fd3e6ded 47396 chrony_4.5-1ubuntu4.1.debian.tar.xz
Files:
 fa50d026df54f9919e6a37fae1258c61 620287 chrony_4.5.orig.tar.gz
 92ab5f33aebe78395c04c195ff005a77 47396 chrony_4.5-1ubuntu4.1.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEiv0I09G4F7LfiYL1AaxLQINZCpgFAmaMGxoACgkQAaxLQINZ
CpjW9g//YjT9JRozzZy+CJAblvh5gOnVZp/OwsHVpWpiFZBT/Uy5I9cPizOAD3mr
Gunf/DXEe5MUee/BrEHYuioNziRhV7+jki9zk/6yWYb53xJG3bV5/VSNfHJ5NbYU
+X2H4fXZLQ6KJf/lXksy7pNAo36RYfH6bGelkpLG9Uj/PT7D78GLlIvva3z3cBlz
co8hJz+2L9Z7x1aJfplA+IUfsOCK6a1oqWMLECC939NcVjmnkZDk3OKrwBI75MvR
L3cvnKKv6uyNYlFpjeM+4CNh9iAO7My55HrpqKpUOklnoQb4f+y96ExHap13DMt0
TCoTKstrFDNSanEcTyJpjk/Pbr/r7mwwp5YO8giJ8eyimHcZT31FkE1geon4ufPS
J5VRG3ibhiuzd/4oo7jEG7jM8yAQm2TRksCfQyO4BBMqhdAfmVoYimann5rcLZ/9
uaOEYhd6lbrbfUvZ5spnh81JbC9LEYBAiFwuc+v7qZaq/YcB2jIQlpMqu/6SeR2g
MFjyNu/DNk5ghbWe+kR0jpgz/wnM7AnPZbmenVM9sWll4VmqQmqL8uaJcoOCsogk
KM0XzdQesxozYVIoiFHBtGKU7TOGfYPOZ+9mIQw1b8I4QFaQP7Tzd9/2kIloDbq9
7n4/lCduIMHvPi9vJOdWpDHWSG9XQ4c4C9S7a0mKyYYnttCueFw=
=yfkp
-----END PGP SIGNATURE-----
