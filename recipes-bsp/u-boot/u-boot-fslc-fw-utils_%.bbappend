FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_imx7s-warp = " file://fw_env.config"
SRC_URI_append_imx7d-pico = " file://fw_env.config"

do_install_append() {
    install -d ${D}${libdir}
    install -m 644  ${S}/tools/env/lib.a ${D}${libdir}/libubootenv.a
}
