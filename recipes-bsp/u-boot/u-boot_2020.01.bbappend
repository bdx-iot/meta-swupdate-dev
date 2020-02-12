FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_stm32mp1 = " \
	file://0001-stm32mp1-add-SWUpdate-Requirements.patch \
"
DEPENDS_append += " u-boot-scr"
