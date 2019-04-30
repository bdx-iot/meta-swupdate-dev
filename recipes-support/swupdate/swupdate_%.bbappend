FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

PACKAGECONFIG_CONFARGS = ""

SRC_URI += " \
     file://swupdate.cfg \
     file://0001-swuforward-fix-install_remote_swu-on-the-first-updat.patch \
"

do_install_append() {
    install -d ${D}${sysconfdir}
    install -m 644 ${WORKDIR}/swupdate.cfg ${D}${sysconfdir}
}
