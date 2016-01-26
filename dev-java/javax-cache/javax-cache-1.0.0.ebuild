# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

MY_PN="cache-api"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Java caching API"
HOMEPAGE="https://github.com/jsr107/jsr107spec"
#http://central.maven.org/maven2/javax/cache/cache-api/1.0.0/cache-api-1.0.0-sources.jar
SRC_URI="https://repo.maven.apache.org/maven2/javax/cache/${MY_PN}/${PV}/${MY_P}-sources.jar"

LICENSE="Apache-2.0" #FIXME
SLOT="0"
KEYWORDS="amd64 ppc ppc64 x86"

IUSE=""

CDEPEND="
	dev-java/cdi-api:1.2"
RDEPEND="
	${CDEPEND}
	>=virtual/jre-1.6"
DEPEND="
	${CDEPEND}
	>=virtual/jdk-1.6
	app-arch/unzip"

JAVA_GENTOO_CLASSPATH="cdi-api-1.2"
