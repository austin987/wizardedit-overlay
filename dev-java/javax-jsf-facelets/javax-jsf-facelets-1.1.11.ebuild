# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

JAVA_PKG_IUSE=""

inherit java-pkg-2

MY_PV="${PV}a"

DESCRIPTION="JSF Facelets"
HOMEPAGE="http://mvnrepository.com/artifact/javax.faces/jsf-facelets"
SRC_URI="http://central.maven.org/maven2/javax/faces/jsf-facelets/${MY_PV}/jsf-facelets-${MY_PV}.jar"

LICENSE="" #FIXME
SLOT="0"
KEYWORDS="amd64 x86"

IUSE=""

RDEPEND=">=virtual/jre-1.4"
DEPEND=""

S="${WORKDIR}"

src_install() {
	java-pkg_newjar "${DISTDIR}/jsf-facelets-${MY_PV}.jar"
}
