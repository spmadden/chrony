-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.5-3ubuntu4
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Homepage: https://chrony-project.org
Standards-Version: 4.7.0
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git -b debian/latest
Testsuite: autopkgtest
Testsuite-Triggers: @builddeps@, build-essential, ca-certificates, dpkg-dev, ethtool, gnutls-bin, iproute2, isc-dhcp-client, isc-dhcp-server, kmod, tzdata-legacy, wget
Build-Depends: asciidoctor, bison, debhelper-compat (= 13), dh-apparmor, gnutls-bin <!nocheck>, iproute2 [linux-any] <!nocheck>, libcap-dev [linux-any], libedit-dev, libgnutls28-dev, libseccomp-dev (>= 2.4.3-1~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el riscv64 s390x x32], nettle-dev, pkgconf, pps-tools [linux-any], procps <!nocheck>
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 4661e5df181a9761b73caeaef2f2ab755bbe086a 620287 chrony_4.5.orig.tar.gz
 117f1dbb67449e9f697140cafa31c11cd3a7dd20 51184 chrony_4.5-3ubuntu4.debian.tar.xz
Checksums-Sha256:
 19fe1d9f4664d445a69a96c71e8fdb60bcd8df24c73d1386e02287f7366ad422 620287 chrony_4.5.orig.tar.gz
 06cc02d2ed6bc7a5191d72a55680c2fa85f7425daba88f58e2694edca6bf4c84 51184 chrony_4.5-3ubuntu4.debian.tar.xz
Files:
 fa50d026df54f9919e6a37fae1258c61 620287 chrony_4.5.orig.tar.gz
 a495bb5cf76c6791d1aabf79f48ec5fc 51184 chrony_4.5-3ubuntu4.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEiv0I09G4F7LfiYL1AaxLQINZCpgFAmciniYACgkQAaxLQINZ
CpgPcRAA6y+1Iz5j5/U415DdI6SSoV2TjtFIO1nY/Eiob/Nx91hCVvvR7BXYaU0H
Cp8jVbB9hRkbTJ/yOoEYcTQso1/qzDy0jUL7kooZRuDtHmao0E8n9zwbNhlHAzps
KffCSd/hJVlb5B2HPZsmW6/MZpNkQrz5vwxxZdKw8wHsJRviEYhqkEcwgEOhcXUs
6VUoBKYEFeHEkIEumu7qnL9U2KhmYRwJrWCee9yOJkPqpAiT7pVkfQaBQURGSLei
A2/FerbnvYOZo4rIcnQBlFsAfKA8l/k58GYQCtU1D8k2Li6oVRgxRYW1YB/2eZyV
RGnyIIny6plhM8gRHnpj19ivRXBGPNI+LjTfo57BO7h4H3lpkxyPeo7XJXXu4eI+
o7oHzlgbLDrnEh8TaTq/MuzPLRFRCVf565ovPtEoC4oItkrXTdYhLb7piqhbJOUf
AjFq2cEEPnA4ybKpud1P6crg0NzhCk1gqzfMagjXN9D+l1GSe284hl14P9fT5QXb
FY6oSHQSBxuoH4TOKhHdL/IYcbOZoF01L7PwptIfq6WOognlyd0cbQfOV5b2olhR
f9C10OCEUH+jFTm47+pvx/bdNmOx/22i++s3SEnFSX6zDIWYuIcLgUZNRuITXsQi
HRGJIM231+4rB8v4ukmqVjTvvsDWgWCsbqzM5vqNkGLMZx8UiTk=
=F73E
-----END PGP SIGNATURE-----
