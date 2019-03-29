SUMMARY = "Environment for SWUpdate"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

inherit systemd

SRC_URI = " \ 
	file://swupdate-env \
	file://swu-environment.service \
"

S = "${WORKDIR}"

do_install() {
	install -d ${D}${bindir}
	install -m 0755 swupdate-env ${D}${bindir}
	
	install -d ${D}${systemd_unitdir}/system
	install -m 644 swu-environment.service ${D}${systemd_unitdir}/system
}

SYSTEMD_SERVICE_${PN} = "swu-environment.service"
