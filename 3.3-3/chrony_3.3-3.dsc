-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Format: 3.0 (quilt)
Source: chrony
Binary: chrony
Architecture: linux-any
Version: 3.3-3
Maintainer: Vincent Blut <vincent.debian@free.fr>
Uploaders: Joachim Wiedorn <joodebian@joonet.de>
Homepage: https://chrony.tuxfamily.org
Standards-Version: 4.2.0
Vcs-Browser: https://salsa.debian.org/debian/chrony
Vcs-Git: https://salsa.debian.org/debian/chrony.git
Testsuite: autopkgtest
Testsuite-Triggers: build-essential, ca-certificates, git, iproute2, isc-dhcp-client, isc-dhcp-server, kmod
Build-Depends: asciidoctor (>= 1.5.3-1~), bison, debhelper (>= 11), dh-apparmor, libcap-dev [linux-any], libedit-dev, libseccomp-dev (>= 2.2.3-3~) [amd64 arm64 armel armhf hppa i386 mips mipsel mips64el powerpc powerpcspe ppc64 ppc64el s390x x32], nettle-dev, pkg-config, pps-tools (>= 0.20120406+g0deb9c7e-2) [linux-any]
Package-List:
 chrony deb net optional arch=linux-any
Checksums-Sha1:
 42fbb94450e50e15aac33aabc563e052ea111f0f 443571 chrony_3.3.orig.tar.gz
 65539542ef8c20869785cdd4bc164db370418e1a 163 chrony_3.3.orig.tar.gz.asc
 ecea12a6d123fee66988db4f08acc99d71328c0e 32296 chrony_3.3-3.debian.tar.xz
Checksums-Sha256:
 0d1fb2d5875032f2d5a86f3770374c87ee4c941916f64171e81f7684f2a73128 443571 chrony_3.3.orig.tar.gz
 22d18f79029cc243d3ec2cb45116c0a03786836fae239e755579005a77be8843 163 chrony_3.3.orig.tar.gz.asc
 90541e441782194ba6e58f2b88d2c3e98d64d9b40a0b4d6c4a8e5011be9e40ca 32296 chrony_3.3-3.debian.tar.xz
Files:
 81ab62cf5d60b4b3fa8cd2c1b267ffd9 443571 chrony_3.3.orig.tar.gz
 a7e8570f073d281faef50f950f9138f1 163 chrony_3.3.orig.tar.gz.asc
 9c56910adf5a272eee3a5ca446fe88f7 32296 chrony_3.3-3.debian.tar.xz

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWLZtSHNr6TsFLeZynFyZ6wW9dQoFAlt5B0cACgkQnFyZ6wW9
dQqnOQf/Vb7UrvtTbQsSfQv1KDqhK4kGkdK8D9EbwgMYMRa/8Q+8pkvwd1YIq4il
c97GtV336bbfonslg9bp76g6vwIxlp2Jz1vpwJ28jq34Z2my4vIr/1Qghlt13vRT
Po89Mtuy5j+yuDfv2zo3dcD3ch/L+F/bI+gtzN+qJuYEC29EfIw927qfRLyCqGqD
KzXMU6xTllYE0K0YuXx1CA9DpWbs5TzuKyRTabGjtb9f7KOpoEHyRXHvWekSDYqz
vr3JbO9bk3nPdc7+UY/XAlHrxIIuwzMTkUwzfSm1mgClSpmEj6slgmjx7JYIH7QL
NUjYv6VZCSicDlEH7ruty81b4Wo+Eg==
=jxFz
-----END PGP SIGNATURE-----
