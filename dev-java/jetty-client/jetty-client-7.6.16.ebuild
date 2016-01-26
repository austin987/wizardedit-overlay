# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2

DATE=20140903
MY_PV=${PV}.v${DATE}
MY_P=${P}-${MY_PV}

DESCRIPTION="Asynchronous HTTP Client for Jetty"
HOMEPAGE="http://www.eclipse.org/jetty/"
SRC_URI="http://git.eclipse.org/c/jetty/org.eclipse.jetty.project.git/snapshot/jetty-${MY_PV}.tar.bz2"
KEYWORDS="~amd64 ~x86"
LICENSE="|| ( Apache-2.0 EPL-1.0 )"
SLOT="7"

COMMON_DEP="~dev-java/jetty-http-${PV}:${SLOT}
	~dev-java/jetty-io-${PV}:${SLOT}
	~dev-java/jetty-util-${PV}:${SLOT}"
RDEPEND=">=virtual/jre-1.5
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.5
	${COMMON_DEP}"

S=${WORKDIR}/jetty-${MY_PV}/${PN}

EANT_GENTOO_CLASSPATH="jetty-http-${SLOT},jetty-io-${SLOT},jetty-util-${SLOT}"
JAVA_ANT_REWRITE_CLASSPATH="true"
EANT_EXTRA_ARGS="-Dmaven.build.finalName=${PN}"

java_prepare() {
	cp "${FILESDIR}"/${PN}-7.6.9-maven-build.xml build.xml || die
}

src_install() {
	java-pkg_dojar target/${PN}.jar
	use doc && java-pkg_dojavadoc target/site/apidocs
	use source && java-pkg_dosrc src/main/java/*
}
