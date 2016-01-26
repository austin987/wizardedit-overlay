# Copyright 2012-2014 Gaikai, a Sony Computer Entertainment company

EAPI="5"

inherit user

DESCRIPTION="The world's most advanced repository manager for maven"
HOMEPAGE="http://www.jfrog.org/products.php"

SRC_URI="http://downloads.sourceforge.net/project/artifactory/artifactory/${PV}/${P}.zip"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

RDEPEND=">=virtual/jre-1.7"

DEPEND=">=virtual/jdk-1.7
		app-arch/unzip"

pkg_setup() {
	enewgroup artifactory
	enewuser artifactory -1 /bin/sh -1 artifactory
}

src_prepare() {
	# These are maintained in gaikai-private's app-admin/artifactory-config:
	rm bin/artifactory.default
	rm tomcat/conf/Catalina/localhost/artifactory.xml
	rm tomcat/conf/server.xml
}

src_install() {
	insinto /opt/artifactory
	doins -r etc
	doins -r logs
	doins -r misc
	doins -r tomcat
	doins -r webapps

	exeinto /opt/artifactory/bin
	doexe bin/*
	exeinto /opt/artifactory/tomcat/bin
	doexe tomcat/bin/*

	keepdir /var/log/artifactory
	fowners artifactory /var/log/artifactory

	keepdir /etc/rc3.d
	keepdir /opt/artifactory/backup
	keepdir /opt/artifactory/data
	keepdir /opt/artifactory/work
	keepdir /opt/artifactory/tomcat/logs
	fowners -R artifactory /opt/artifactory
}

pkg_postinst()
{
	# Use the upstream installer script rather than reimplementing it for a one-off:
	cd /opt/artifactory/bin 
	if [ -f /etc/rc3.d/S99artifactory ]
	then
        	rm /etc/rc3.d/S99artifactory
	fi
	./installService.sh 
}
