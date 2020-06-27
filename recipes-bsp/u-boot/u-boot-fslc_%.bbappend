FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:imx7d-pico = " \
	file://0001-pico-imx7d-add-SWUpdate-Requirements.patch \
"

SRC_URI:append:imx7s-warp = " \
	file://0001-warp7-add-SWUpdate-requirements.patch \
	file://0002-warp7-add-support-for-warp7-ynov-board.patch \
"

DEPENDS:append = " u-boot-scr"
