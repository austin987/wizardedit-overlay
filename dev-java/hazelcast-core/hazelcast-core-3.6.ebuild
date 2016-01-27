# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

JAVA_PKG_IUSE="doc source test"

inherit java-pkg-2 java-pkg-simple

MY_PN="hazelcast"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Open Source In-Memory Data Grid"
HOMEPAGE="http://hazelcast.org/"
SRC_URI="https://github.com/hazelcast/${MY_PN}/archive/v${PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="3.6"
KEYWORDS="amd64 x86"

CDEPEND="
	dev-util/findbugs:0
	dev-java/javax-cache:0
	dev-java/log4j-api:2
	dev-java/minimal-json:0
	dev-java/osgi-core-api:0
	dev-java/slf4j-api:0
	"

DEPEND=">=virtual/jdk-1.7
	${CDEPEND}"

RDEPEND=">=virtual/jre-1.7
	${CDEPEND}"

JAVA_GENTOO_CLASSPATH="findbugs,javax-cache,minimal-json,osgi-core-api,log4j-api-2,slf4j-api"

JAVA_SRC_DIR="${S}/${MY_P}/${MY_PN}/src/main/java/com/${MY_PN}"
