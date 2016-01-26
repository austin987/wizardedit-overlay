# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2

DESCRIPTION="Utility classes for Jetty"
HOMEPAGE="http://jetty.codehaus.org/jetty/"
SRC_URI="http://pkgs.fedoraproject.org/repo/pkgs/jetty/jetty-${PV}-src.zip/4980757517064efbf655e025d005a0b8/jetty-${PV}-src.zip"
KEYWORDS="~amd64 ~x86"
LICENSE="Apache-2.0"
SLOT="6"

COMMON_DEP="dev-java/slf4j-api
	java-virtuals/servlet-api:2.5"
RDEPEND=">=virtual/jre-1.4
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.4
	${COMMON_DEP}"

S=${WORKDIR}/jetty-${PV}/modules/util

EANT_GENTOO_CLASSPATH="slf4j-api,servlet-api-2.5"
JAVA_ANT_REWRITE_CLASSPATH="true"
EANT_EXTRA_ARGS="-Dmaven.build.finalName=${PN}"

java_prepare() {
	cp "${FILESDIR}"/${P}-maven-build.xml build.xml || die
}

src_install() {
	java-pkg_dojar target/${PN}.jar
	use doc && java-pkg_dojavadoc target/site/apidocs
	use source && java-pkg_dosrc src/main/java/*
}
