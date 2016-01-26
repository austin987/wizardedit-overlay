# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

MY_PN="${PN/-*/}"

DESCRIPTION="Jetty io"
HOMEPAGE="http://www.eclipse.org/jetty/"
SRC_URI="http://central.maven.org/maven2/org/mortbay/${MY_PN}/${MY_PN}/${PV}/${MY_PN}-${PV}-sources.jar"
KEYWORDS="~amd64 ~x86"
LICENSE="|| ( Apache-2.0 EPL-1.0 )"
SLOT="6"

COMMON_DEP="
	~dev-java/jetty-util-${PV}:${SLOT}
	java-virtuals/servlet-api:2.5"
RDEPEND=">=virtual/jre-1.7
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.7
	${COMMON_DEP}"

S=${WORKDIR}

JAVA_GENTOO_CLASSPATH="
	jetty-util-${SLOT}
	servlet-api-2.5"

src_install() {
	java-pkg_dojar ${PN}.jar
	use doc && java-pkg_dojavadoc target/site/apidocs
	use source && java-pkg_dosrc src/main/java/*
}
