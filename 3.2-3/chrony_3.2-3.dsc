-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.2-3
Maintainer: Vincent Blut <vincent.debian@free.fr>
Uploaders: Joachim Wiedorn <joodebian@joonet.de>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.1.3
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential, ca-certificates, git
Build-Depends: debhelper (>= 11), bison, libedit-dev, libtomcrypt-dev, libcap-dev [linux-any], pps-tools (>= 0.20120406+g0deb9c7e-2) [linux-any], libseccomp-dev (>= 2.2.3-3~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el s390x x32], pkg-config, asciidoctor (>= 1.5.3-1~), dh-apparmor
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 64db6c31e013222cc0a2b66322192b4cedf6e048 433882 chrony_3.2.orig.tar.gz
 ba1863397b701d56f86d929c09c6054837a16cd6 163 chrony_3.2.orig.tar.gz.asc
 c3ce1a39500e998e795d8d6ea7d58146400efdd2 28052 chrony_3.2-3.debian.tar.xz
Checksums-Sha256:
 329f6718dd8c3ece3eee78be1f4821cbbeb62608e7d23f25da293cfa433c4116 433882 chrony_3.2.orig.tar.gz
 4434f5f6eca4781ac906e260db2444f9ce08df4406621e0c0b58818b5a78cb9c 163 chrony_3.2.orig.tar.gz.asc
 92979295b904a5aac04e049f0815b652fab82daba35158c4c03a1e333486d3e2 28052 chrony_3.2-3.debian.tar.xz
Files:
 f4c4eb0dc92f35ee4bb7d3dcd8029ecb 433882 chrony_3.2.orig.tar.gz
 1cfedd4f4838de9b8c4bb8a7990d6750 163 chrony_3.2.orig.tar.gz.asc
 0ba04aeac11725c0b351ed33d9f34c0a 28052 chrony_3.2-3.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAlp8lhwACgkQnFyZ6wW9
dQqItAf/Rg/dMZIhIUqy9YyJaPDkbsWbxCa1tSVZlBcqEPbl3mt2UU8klRxnFRYE
mH8apjcFvCNv+cvs1nZhZR/2J21mJHe3W8ckbXyMD5iaygj3UWfOCD5w59t9rfHT
N03BQo8WmsjmVs2mlG/72AvV+Fe70cDHtSXRpJ4TJ3BcA6GrvL8Lyhcy+/+E15Ah
DucmNdek/DHNd05pzHafYRM7d2uo0CbX4dJ1TO06EyFRx6dOowVGv9xlTgqFwcUb
BH3zrtQIFWDJSgiue+qjcPv/fftQp3QeBCLFgphpRPADof/c0JTgjdFgQYIcuogV
uZ6iQszZlBbUMgHUnY2kZTYubVcCdQ==
=chII
-----END PGP SIGNATURE-----
