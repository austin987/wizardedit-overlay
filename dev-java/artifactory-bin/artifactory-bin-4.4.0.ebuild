# Copyright 2012-2014 Gaikai, a Sony Computer Entertainment company

EAPI="5"

inherit user

MY_P="${P/-bin}"
MY_PN="${PN/-bin}"
MY_PV="${PV/-bin}"

DESCRIPTION="The world's most advanced repository manager for maven"
HOMEPAGE="http://www.jfrog.org/products.php"
SRC_URI="https://bintray.com/artifact/download/jfrog/artifactory/jfrog-artifactory-oss-${MY_PV}.zip -> ${MY_P}.zip"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="ssl"

RDEPEND=">=virtual/jre-1.8"
DEPEND=">=virtual/jdk-1.8
app-arch/unzip"

S="${WORKDIR}/${MY_PN}-oss-${MY_PV}"

pkg_setup() {
    enewgroup artifactory
    enewuser artifactory -1 /bin/sh -1 artifactory
}

src_prepare() {
	if use ssl ; then
		cp ${FILESDIR}/${MY_P}-artifactory.xml tomcat/conf/Catalina/localhost/artifactory.xml || die
		cp ${FILESDIR}/${MY_P}-server.xml tomcat/conf/server.xml || die
	fi

	# See FIXME in src_install(), this can probably go away, but catalina.sh may need to be fixed for that:
	sed -i -e "s%/etc/opt/jfrog/artifactory/default%/etc/conf.d/${MY_PN}%g;" misc/service/setenv.sh || die
}

src_install() {
	local ARTIFACTORY_HOME="/opt/artifactory"
	local TOMCAT_HOME="${ARTIFACTORY_HOME}/tomcat"

	insinto ${ARTIFACTORY_HOME}
	doins -r logs
	doins -r misc
	doins -r tomcat
	doins -r webapps
	doins -r etc

	dodir /etc/opt/jfrog
	dosym ${ARTIFACTORY_HOME}/etc /etc/opt/jfrog/artifactory

	exeinto ${ARTIFACTORY_HOME}/bin
	doexe bin/*

	exeinto ${TOMCAT_HOME}/bin
	# FIXME: this is called by catalina.sh (it echoes the variables before starting artifactory, as well as makes sure log dir, etc. exists).
	# Those directories could probably be moved to the ebuild and the script removed from catalina.sh without consequence (and quieter starts)
	# Would need to check if CATALINA_* variables are actually used anywhere (from reading code don't appear to be actually needed)
	doexe misc/service/setenv.sh
	doexe tomcat/bin/*

	keepdir ${ARTIFACTORY_HOME}/backup
	keepdir ${ARTIFACTORY_HOME}/data
	keepdir ${ARTIFACTORY_HOME}/run
	keepdir ${ARTIFACTORY_HOME}/work
	keepdir ${TOMCAT_HOME}/logs/catalina
	keepdir ${TOMCAT_HOME}/temp
	keepdir ${TOMCAT_HOME}/work
	keepdir /var/opt/jfrog/artifactory/run

	newconfd ${FILESDIR}/confd ${MY_PN}
	newinitd ${FILESDIR}/initd ${MY_PN}

	# FIXME: /var/log/artifactory isn't being used currently:
	keepdir /var/log/artifactory
	fowners artifactory /var/log/artifactory

	fowners -R artifactory:artifactory ${ARTIFACTORY_HOME}
	fperms -R u+w ${TOMCAT_HOME}/work
}
