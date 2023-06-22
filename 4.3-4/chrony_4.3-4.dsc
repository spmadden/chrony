-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 4.3-4
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
 bc7884eb4fde69478a00faee3d42092d426d57c1 593560 chrony_4.3.orig.tar.gz
 70d022ec86489cfc9b2284dcb1bd2fe6ed5f4c50 833 chrony_4.3.orig.tar.gz.asc
 a094540dfb79b9c59eb3018101506ba7cb5cbd58 40652 chrony_4.3-4.debian.tar.xz
Checksums-Sha256:
 9d0da889a865f089a5a21610ffb6713e3c9438ce303a63b49c2fb6eaff5b8804 593560 chrony_4.3.orig.tar.gz
 eb2837eb29e3ef2892ea6ae1d0615c2b83ddbaf45c8bb508dc35042feff2fc8d 833 chrony_4.3.orig.tar.gz.asc
 7aeb02667410a8657b464777e5b2a53f14a5428075286f3347178b949a9567c0 40652 chrony_4.3-4.debian.tar.xz
Files:
 765dd8c085a0be2a52f9e9135665f0b7 593560 chrony_4.3.orig.tar.gz
 440a45cbb7bc3363a9091bc686012f63 833 chrony_4.3.orig.tar.gz.asc
 7ec4c90cb925d3cb693e5b952a6d6629 40652 chrony_4.3-4.debian.tar.xz
Dgit: 6bad1066208c25c16e761a08f39b457027bcccc4 debian archive/debian/4.3-4 https://git.dgit.debian.org/chrony

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAmSTVf0ACgkQnFyZ6wW9
dQqPjggAmvjBn+3s6FmDEmnlbqQC6L55rztn6DppiX7CKXB32K6oJ/nC4MZ8hAvz
JMAUO073TxeWyP6/z233wEY7TMWxU1bmXALl7Drgoai+ylhueNGiA2DICAu9c65x
lSEXOoFQ3/QIoWkTcwjtooNlrhvX6BZxBQ9DUrS1UKTgl6GdfpeFwvsLyXKie44T
PCyMeQOWd8pXpMVWsulTn1bITyFdYKV2B5B3SyEB9aRzMzPEtir3+MLvhRcfhj72
lC2ikj370VYkeVsxQJdAV+lp+FCvS+KUJO0eugWQyLu+sYdR5+nM7ZLY+pIpMyxG
UC1HNG/8E2olNudSbi6FRg2RVPEh6Q==
=0SaU
-----END PGP SIGNATURE-----
