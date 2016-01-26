# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

MY_PN="javaee-api"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="
HOMEPAGE="
SRC_URI="http://central.maven.org/maven2/javax/${MY_PN}/${PV}/${MY_P}-sources.jar"

LICENSE="" #FIXME
SLOT="0"
KEYWORDS="amd64 ppc ppc64 x86"

IUSE=""

CDEPEND="
	dev-java/oracle-javamail:0"
RDEPEND="
	${CDEPEND}
	>=virtual/jre-1.6"
DEPEND="
	${CDEPEND}
	>=virtual/jdk-1.6
	app-arch/unzip"

JAVA_GENTOO_CLASSPATH="oracle-javamail"
