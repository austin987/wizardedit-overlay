# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

JAVA_PKG_IUSE="source doc"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A small Java library with one purpose: To instantiate a new object of a class"
HOMEPAGE="https://github.com/easymock/objenesis/releases"

# The 2.1 release doesn't have binaries, just source, unlike other releases..
SRC_URI="https://github.com/easymock/objenesis/archive/${PV}.zip -> ${P}.zip"

LICENSE="Apache-2.0"
SLOT="2.1"
KEYWORDS="amd64 x86 ppc ppc64"
IUSE=""

RDEPEND=">=virtual/jre-1.5"
DEPEND=">=virtual/jdk-1.5"

S="${WORKDIR}/${P}"
JAVA_SRC_DIR="main/src/org"
