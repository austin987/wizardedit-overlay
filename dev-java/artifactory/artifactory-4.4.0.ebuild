# Copyright 2012-2014 Gaikai, a Sony Computer Entertainment company

EAPI="5"

inherit java-pkg-2 java-pkg-simple user

DESCRIPTION="The world's most advanced repository manager for maven"
HOMEPAGE="http://www.jfrog.org/products.php"

# FIXME: no source release: https://www.jfrog.com/jira/browse/RTFACT-8961
SRC_URI="https://example.com/${P}.tar.xz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="ssl"

CDEPEND="dev-java/commons-io:1
		dev-java/commons-lang:2.1
		dev-java/guava:18
		dev-java/jackson-annotations:2
		dev-java/jcommander:0
		dev-java/joda-time:0
		dev-java/slf4j-api:0
		dev-java/slf4j-log4j12:0
		dev-java/slf4j-simple:0
		dev-java/spring-beans:4.1
		dev-java/spring-core:4.1
		dev-java/spring-expression:4.1
		dev-java/spring-instrument:4.1
		dev-java/testng:0
		dev-java/xstream:0"

RDEPEND=">=virtual/jre-1.8
		${CDEPEND}"

DEPEND=">=virtual/jdk-1.8
		${CDEPEND}"

JAVA_GENTOO_CLASSPATH="slf4j-api,slf4j-log4j12,slf4j-simple,spring-beans:4.1,spring-core:4.1,spring-expression:4.1,spring-instrument:4.1,commons-io:1,commons-lang:2.1,guava:18,jackson-annotations:2,joda-time,testng,xstream,jcommander"

pkg_setup() {
    enewgroup artifactory
    enewuser artifactory -1 /bin/sh -1 artifactory
}

# Build is undocumented (needs jfrog maven repo, etc.), but we're not using maven anyway...

