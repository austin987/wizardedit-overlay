# Copyright 2012-2014 Gaikai, a Sony Computer Entertainment company

EAPI="5"

inherit user

DESCRIPTION="The world's most advanced repository manager for maven"
HOMEPAGE="http://www.jfrog.org/products.php"

SRC_URI="http://downloads.sourceforge.net/project/artifactory/artifactory/${PV}/${P}.zip"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="ssl"

RDEPEND=">=virtual/jre-1.7"

DEPEND=">=virtual/jdk-1.7
app-arch/unzip"

pkg_setup() {
	enewgroup artifactory
	enewuser artifactory -1 /bin/sh -1 artifactory
}

src_prepare() {
	# upstream variables:
	export ARTIFACTORY_HOME="/opt/artifactory"
	export TOMCAT_HOME="/opt/artifactory/tomcat"

	cp ${FILESDIR}/${P}-artifactory.default bin/artifactory.default || die

	if use ssl ; then
		cp ${FILESDIR}/${P}-artifactory.xml tomcat/conf/Catalina/localhost/artifactory.xml || die
		cp ${FILESDIR}/${P}-server.xml tomcat/conf/server.xml || die
	fi

	sed -i -e "s,#export ARTIFACTORY_HOME=.*,export ARTIFACTORY_HOME=${ARTIFACTORY_HOME},g; \
	s,#export ARTIFACTORY_USER=.*,export ARTIFACTORY_USER=artifactory,g; \
	s,export TOMCAT_HOME=.*,export TOMCAT_HOME=${TOMCAT_HOME},g; \
	s,export $ARTIFACTORY_PID=.*,export $ARTIFACTORY_PID=${ARTIFACTORY_HOME}/run/artifactory.pid,g;" bin/artifactory.default || die

	# NOTE: upstream ships two init files (bin/artifactory.sh misc/service/artifactory), we use misc/service/artifactory
	# Filed upstream bug: https://www.jfrog.com/jira/browse/RTFACT-6600
	sed -i -e "s%# pidfile: .*%# pidfile: ${ARTIFACTORY_HOME}/run/artifactory.pid%g; \
	s%/etc/opt/jfrog/artifactory/default%${ARTIFACTORY_HOME}/bin/artifactory.default%g;" misc/service/artifactory || die

	sed -i -e "s%/etc/opt/jfrog/artifactory/default%${ARTIFACTORY_HOME}/bin/artifactory.default%g;" misc/service/setenv.sh || die
}

src_install() {
	insinto ${ARTIFACTORY_HOME}
	doins -r logs
	doins -r misc
	doins -r tomcat
	doins -r webapps
	cp -r etc "${D}"/${ARTIFACTORY_HOME}/etc

	dodir /etc/opt/jfrog
	dosym ${ARTIFACTORY_HOME}/etc /etc/opt/jfrog/artifactory

	exeinto ${ARTIFACTORY_HOME}/bin
	doexe bin/*
	exeinto ${TOMCAT_HOME}/bin
	doexe misc/service/setenv.sh
	doexe tomcat/bin/*

	keepdir /var/log/artifactory
	keepdir ${ARTIFACTORY_HOME}/backup
	keepdir ${ARTIFACTORY_HOME}/data
	keepdir ${ARTIFACTORY_HOME}/run
	keepdir ${ARTIFACTORY_HOME}/work
	keepdir ${TOMCAT_HOME}/logs/catalina
	keepdir ${TOMCAT_HOME}/temp
	keepdir ${TOMCAT_HOME}/work
	keepdir /var/opt/jfrog/artifactory/run

	newinitd misc/service/artifactory artifactory
	dosym ${ARTIFACTORY_HOME}/bin/artifactory.default /etc/conf.d/artifactory

	fowners -R artifactory:artifactory ${ARTIFACTORY_HOME}
	fowners artifactory /var/log/artifactory
	fperms -R u+w ${TOMCAT_HOME}/work
}
