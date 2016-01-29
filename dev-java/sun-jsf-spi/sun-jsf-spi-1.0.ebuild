# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION=""
HOMEPAGE="https://javaserverfaces.java.net/"
SRC_URI="http://central.maven.org/maven2/com/sun/faces/jsf-spi/${PV}/jsf-spi-${PV}-sources.jar"

LICENSE="" #FIXME
SLOT="0"
KEYWORDS="amd64"

IUSE=""

CDEPEND="
	dev-java/groovy:0
	dev-java/javax-el-api:0
	dev-java/mojarra:2.2
	dev-java/oracle-javamail:0
	dev-java/tomcat-jstl-spec:0
	dev-java/tomcat-servlet-api:3.0
	dev-java/validation-api:1.0
	dev-java/javax-jsf-facelets:0"
RDEPEND="
	${CDEPEND}
	>=virtual/jre-1.6"
DEPEND="
	${CDEPEND}
	>=virtual/jdk-1.6
	app-arch/unzip"

JAVA_GENTOO_CLASSPATH="groovy,javax-el-api,javax-jsf-facelets,mojarra-2.2,oracle-javamail,tomcat-jstl-spec,tomcat-servlet-api-3.0,validation-api-1.0"
