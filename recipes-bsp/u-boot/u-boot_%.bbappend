FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:stm32mp1 = " \
	file://0001-stm32mp1-add-SWUpdate-Requirements.patch \
"

DEPENDS:append = " u-boot-scr"
