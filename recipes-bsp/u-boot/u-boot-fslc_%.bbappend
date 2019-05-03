FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_imx7d-pico = " \
	file://0001-pico-imx7d-add-SWUpdate-Requirements.patch \
    file://0002-pico-imx7d-Disable-CONFIG_VIDEO.patch \
"

SRC_URI_append_imx7s-warp = " \
	file://0001-warp7-add-SWUpdate-requirements.patch \
"

DEPENDS_append_imx7s-warp += " u-boot-scr"