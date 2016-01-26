# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

JAVA_PKG_IUSE="doc"

inherit java-pkg-2 java-ant-2 eutils

MY_PN="jamon"

DESCRIPTION="Java API to monitor production applications"
HOMEPAGE="http://jamonapi.sourceforge.net/"

#http://downloads.sourceforge.net/project/jamonapi/jamonapi/v2_81/jamonall-2.81.zip
SRC_URI="mirror://sourceforge/${PN}/${MY_PN}all-${PV}.zip"

LICENSE="BSD"
SLOT="2.79"
KEYWORDS="~amd64 ~x86"

# FIXME: is aspectj actually used?

RDEPEND=">=virtual/jre-1.5
	dev-java/aspectj:0
	dev-java/glassfish-interceptor-api:0
	dev-java/jetty-server:6
	dev-java/jetty-server:7
	dev-java/log4j:0
	dev-java/spring-core:4.1
	java-virtuals/servlet-api:2.3"

JAVA_ANT_REWRITE_CLASSPATH="true"
EANT_GENTOO_CLASSPATH="
	aspectj
	glassfish-interceptor-api
	log4j
	jetty-server:6
	jetty-server:7
	servlet-api-2.3
	spring-core-4.1"


DEPEND=">=virtual/jdk-1.5
	dev-java/aspectj:0
	dev-java/glassfish-interceptor-api:0
	dev-java/jetty-server:7
	dev-java/log4j:0
	app-arch/unzip
	${RDEPEND}"

S="${WORKDIR}"
#JAVA_SOURCE_

java_prepare() {
	rm -rf __MACOSX
	rm ${MY_PN}all-${PV}/${MY_PN}-${PV}{,-javadoc}.jar ${MY_PN}all-${PV}/${MY_PN}{-osmon,tomcat}-${PV}.jar ${MY_PN}all-${PV}/${MY_PN}.war || die
	
	# No provided ant script! Bad upstream, bad!
	cp "${FILESDIR}"/build-1.0.xml build.xml || die
	
	mkdir ${S}/src
	cd ${S}/src
	unpack ./../${MY_PN}all-${PV}/${MY_PN}-${PV}-sources.jar
}

#src_compile() {
#	eant jar $(use_doc) \
#		-Dproject.name=${PN} \
#        -Dclasspath=$(java-pkg_getjars servlet-api-2.3):$(java-pkg_getjars glassfish-interceptor-api)
#}

src_install() {
	java-pkg_dojar dist/${PN}.jar

	use doc && java-pkg_dojavadoc dist/doc/api
}
