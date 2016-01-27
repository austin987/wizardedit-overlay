# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
JAVA_PKG_IUSE="doc source test"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A fast and small JSON parser and writer for Java"
HOMEPAGE="https://github.com/ralfstx/minimal-json"
SRC_URI="https://github.com/ralfstx/minimal-json/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

CDEPEND="dev-java/hamcrest-core:1.3
	dev-java/mockito:0"

RDEPEND="
	${CDEPEND}
	dev-java/junit:4
	>=virtual/jre-1.7"

DEPEND="
	${CDEPEND}
	>=virtual/jdk-1.7
	app-arch/unzip
    test? (
        dev-java/junit:4
    )"

JAVA_GENTOO_CLASSPATH="hamcrest-core-1.3,junit-4,mockito"

java_prepare() {
	rm -rf ${P}/com.eclipsesource.json.performancetest
}
