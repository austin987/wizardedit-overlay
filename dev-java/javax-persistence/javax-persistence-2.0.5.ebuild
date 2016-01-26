# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

MY_PV="${PV}.v201212031355"

DESCRIPTION="Java Persistence API"
HOMEPAGE="https://github.com/eclipse/javax.persistence"
SRC_URI="https://github.com/eclipse/javax.persistence/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="EPL-1.0" #FIXME
SLOT="0"
KEYWORDS="amd64 ppc ppc64 x86"

JAVA_ENCODING="ISO-8859-1"

IUSE=""

CDEPEND="dev-java/osgi-core-api:0"

RDEPEND="
	${CDEPEND}
	>=virtual/jre-1.6"
DEPEND="
	${CDEPEND}
	>=virtual/jdk-1.6
	app-arch/unzip"

JAVA_GENTOO_CLASSPATH="osgi-core-api"
