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
KEYWORDS="~amd64"

CDEPEND="
	dev-java/ant-junit4:0
	dev-java/aopalliance:1
	dev-java/aspectj:0
	dev-java/bsh:0
	dev-java/commons-logging:0
	dev-java/commons-pool:0
	dev-java/concurrent-util:0
	dev-java/hamcrest-core:1.3
	dev-java/hamcrest-library:1.3
	dev-java/groovy:0
	dev-java/javax-cache:0
	dev-java/javax-enterprise-concurrent:0
	dev-java/javax-el-api:0
	dev-java/javax-inject:0
	dev-java/javax-interceptor-api:0
	dev-java/javax-persistence:0
	dev-java/junit:4
	dev-java/mockito:0
	dev-java/snakeyaml:0
	dev-java/spring-core:${SLOT}
	dev-java/spring-beans:${SLOT}
	dev-java/spring-expression:${SLOT}
	dev-java/xmlunit:1
	java-virtuals/ejb-api:0"

DEPEND=">=virtual/jdk-1.8
	${CDEPEND}"

RDEPEND=">=virtual/jre-1.8
	${CDEPEND}"

S="${WORKDIR}/spring-framework-${PV}.RELEASE/"

JAVA_GENTOO_CLASSPATH="aopalliance-1,aspectj,bsh,commons-logging,commons-pool,concurrent-util,ejb-api,groovy,hamcrest-library-1.3,hamcrest-core-1.3,javax-cache,javax-el-api,javax-enterprise-concurrent,javax-interceptor-api,javax-inject,javax-persistence,junit-4,mockito,snakeyaml,spring-core-${SLOT},spring-beans-${SLOT},spring-expression-${SLOT},xmlunit-1"

# hidden under spring-context instead of its own dir:
JAVA_SRC_DIR="${S}/spring-context/src/main/java/org/springframework/stereotype"
