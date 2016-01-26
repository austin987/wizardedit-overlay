# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

JAVA_PKG_IUSE="doc source test"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A comprehensive programming and configuration model for modern Java-based enterprise applications"
HOMEPAGE="http://www.springsource.org/spring-framework"
SRC_URI="https://github.com/SpringSource/spring-framework/archive/v${PV}.RELEASE.tar.gz -> spring-framework-${PV}.tar.gz
		https://dev.gentoo.org/~ercpe/distfiles/dev-java/spring-framework/spring-framework-${PV}-buildscripts.tar.bz2"

LICENSE="Apache-2.0"
SLOT="4.1"
KEYWORDS="~amd64 ~x86"

IUSE=""

CDEPEND="dev-java/spring-core:${SLOT}
	dev-java/spring-beans:${SLOT}
	dev-java/aopalliance:1
	dev-java/aspectj:0
	dev-java/bsh:0
	dev-java/commons-logging:0
	dev-java/commons-pool:0
	dev-java/groovy:0
	dev-java/hamcrest-core:1.3
	dev-java/hamcrest-library:1.3
	dev-java/jamon:2.79
	dev-java/javax-cache:0
	dev-java/javax-el-api:0
	dev-java/javax-enterprise-concurrent:0
	dev-java/javax-inject:0
	dev-java/javax-interceptor-api:0
	dev-java/javax-persistence:0
	dev-java/junit:4
	dev-java/mockito:0
	dev-java/myfaces-api:0
	dev-java/objenesis:2.1
	dev-java/snakeyaml:0
	dev-java/xmlunit:1
	java-virtuals/ejb-api:0"

DEPEND=">=virtual/jdk-1.8
		dev-java/ant-junit4:0
		${CDEPEND}"

RDEPEND=">=virtual/jre-1.8
	${CDEPEND}"

S="${WORKDIR}/spring-framework-${PV}.RELEASE/"

JAVA_GENTOO_CLASSPATH="
	aopalliance-1
	aspectj
	bsh
	commons-logging
	commons-pool
	ejb-api
	groovy
	hamcrest-core-1.3
	hamcrest-library-1.3
	jamon-2.79
	javax-cache
	javax-el-api
	javax-enterprise-concurrent
	javax-inject
	javax-interceptor-api
	javax-persistence
	junit-4
	mockito
	myfaces-api
	objenesis-2.1
	snakeyaml
	spring-beans-${SLOT}
	spring-core-${SLOT}
	xmlunit-1"

src_install() {
	java-pkg_dojar "${S}"/${PN}/dist/${PN}.jar

	use source && java-pkg_dosrc "${S}"/${PN}/src/main/java/org/
	use doc && java-pkg_dojavadoc "${S}"/${PN}/dist/apidocs/
}

src_test() {
	java-pkg-2_src_test
}
