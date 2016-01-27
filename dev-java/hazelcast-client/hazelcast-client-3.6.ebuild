# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

JAVA_PKG_IUSE="doc source test"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Open Source In-Memory Data Grid"
HOMEPAGE="http://hazelcast.org/"
SRC_URI="https://github.com/hazelcast/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="Apache-2.0" #FIXME
SLOT="4.1"
KEYWORDS="amd64 x86"

IUSE=""

CDEPEND="
"

DEPEND=">=virtual/jdk-1.7
	test? (
		>=dev-java/junit-4.11:4
		dev-java/hamcrest-core:1.3
		dev-java/hamcrest-library:1.3
		dev-java/mockito:0
		dev-java/xmlunit:1
	)
	${CDEPEND}"

RDEPEND=">=virtual/jre-1.7
	${CDEPEND}"

JAVA_GENTOO_CLASSPATH="
	asm-4"

src_test() {
	java-pkg-2_src_test
}
