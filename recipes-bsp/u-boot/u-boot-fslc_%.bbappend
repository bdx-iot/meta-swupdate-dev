FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_imx7d-pico = " \
	file://0001-pico-imx7d-add-SWUpdate-Requirements.patch \
"

SRC_URI_append_imx7s-warp = " \
	file://0001-warp7-add-SWUpdate-requirements.patch \
"

DEPENDS_append += " u-boot-scr"

# See Stefano's patch : http://patchwork.ozlabs.org/patch/1051159/

do_compile_append()  {
    oe_runmake -C ${S} O=${B}/${config} u-boot-initial-env
}

do_install_append () {
    install -d ${D}/${sysconfdir}
    install -m 644 ${B}/${config}/u-boot-initial-env ${D}/${sysconfdir}/u-boot-initial-env
}

do_deploy_append () {
    install -d ${DEPLOYDIR}
    install -m 644 ${B}/${config}/u-boot-initial-env ${DEPLOYDIR}/u-boot-initial-env
}

PACKAGES =+ "${PN}-initial-env"
FILES_${PN}-initial-env = "${sysconfdir}/u-boot-initial-env"
