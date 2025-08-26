#!/bin/bash

set -euxo pipefail
#if [[ -z "$CHRONYBRANCH" ]] ; then
#	echo "usage: $0 <chrony_branch_id>"
#	exit 1;
#fi

GITHOST=https://github.com/spmadden/chrony
SIGNKEY=0x..

apt update
apt -y install \
	git \
	dpkg-dev \
	dpkg-cross \
	asciidoctor \
	bison \
	debhelper-compat \
	dh-apparmor \
	gnutls-bin \
	iproute2 \
	libcap-dev \
	libedit-dev \
	libgnutls28-dev \
	libseccomp-dev \
	nettle-dev \
	pkg-config \
	pps-tools

git clone $GITHOST
cd chrony
git worktree add ../ubuntu-chrony ubuntu/applied/debian/bookworm
pushd ../ubuntu-chrony

export DEB_SIGN_KEYID=$SIGNKEY
export DEB_TARGET=x86_64
dpkg-buildpackage 
popd
