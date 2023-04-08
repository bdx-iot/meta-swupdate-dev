FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:imx8mp-debix = " \
	file://0002-imx8mp-debix-add-requirements-for-swupdate.patch \
"

DEPENDS:append = " u-boot-scr"
