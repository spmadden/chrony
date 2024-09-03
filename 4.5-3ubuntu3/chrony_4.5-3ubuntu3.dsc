-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.5-3ubuntu3
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
 b405aba3769685d12345db1f7732572ac62534e1 49412 chrony_4.5-3ubuntu3.debian.tar.xz
Checksums-Sha256:
 19fe1d9f4664d445a69a96c71e8fdb60bcd8df24c73d1386e02287f7366ad422 620287 chrony_4.5.orig.tar.gz
 c725561c8d34c8997faad4bbeda914f4e942fbc7147af7d53d5b5963b9ece69b 49412 chrony_4.5-3ubuntu3.debian.tar.xz
Files:
 fa50d026df54f9919e6a37fae1258c61 620287 chrony_4.5.orig.tar.gz
 b991544d08ba86f4be7312cd728589ce 49412 chrony_4.5-3ubuntu3.debian.tar.xz
Original-Maintainer: Vincent Blut <vincent.debian@free.fr>

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEiv0I09G4F7LfiYL1AaxLQINZCpgFAmbXR8AACgkQAaxLQINZ
Cph+pRAA7tgylMQNsTCCHVDxIAIZEH47afK4yOR/kzXfQM3e2TdHiOLGDpMSVjwG
GANwdLRYKj5vE0GrMtfR4VixYbx2PgZtb52616nWc2RWCXG/aZelBelHi8L6Rxwf
nn7f78yQELApkZWd5FAFZ9yl0qoiItNfKakepLtxi7IeGko3rPgmFOW6hq12ynI0
zjMi9NfSukq1j4nCvPEqeiUnNwrAY1C6WJXWq2rLja46nup02P681E8TENP/W+qM
UokQEyC2L90ITAzUeBUJpBBfky0/GfZJdZrO553kEJ+gu+ojeCl2nhVvfOO8nglC
gZszx+3bGC5MFqRgEJXP2gAaDwNv8pm7FY2SoNvS6QLHk3GiaSD2xpEJeQT+L487
hl+zUrfblcd8uHqXdIcuqSDROtiH0ltrzqcSsYPj/IjqMlnYmeLNXV7bDP43GHN8
bE9TZxaX+ILYi/oFwVuIOTAyaahC/m3EWB59tYiSyNj88PluvkNzigq5/piiDdvU
ZFGk2/3nUUtp/qcCCJiE+Kn1A31Pq5O+aH6N8TGy5DISGf+HMZHiDIb8cZjOCVIa
9LUymENAfZ0lShlZQTZWyEWkevnbsHGK1I1jX8wzJrIGFKodGlDdpvv3DBfctzvk
9vMt4zm99gq4QfG/o/UkPvd1ysuXiHLQIsMGPmjEozHzAoV9LpE=
=u2OC
-----END PGP SIGNATURE-----
