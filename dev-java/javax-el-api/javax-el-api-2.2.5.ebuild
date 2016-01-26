# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

MY_PN="${PN/-/.}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="" #FIXME
HOMEPAGE="" #FIXME
SRC_URI="https://repo.maven.apache.org/maven2/javax/el/javax.el-api/${PV}/${MY_P}-sources.jar"

LICENSE="Apache-2.0" #FIXME
SLOT="0"
KEYWORDS="amd64 ppc ppc64 x86"

IUSE=""

RDEPEND="
	${CDEPEND}
	>=virtual/jre-1.6"
DEPEND="
	${CDEPEND}
	>=virtual/jdk-1.6
	app-arch/unzip"
