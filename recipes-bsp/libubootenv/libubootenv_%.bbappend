FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

LIC_FILES_CHKSUM = "file://LICENSES/LGPL-2.1-or-later.txt;md5=4fbd65380cdd255951079008b364516c"

SRC_URI:append = " \
	file://fw_env.config.in \
"

SRCREV = "94d5ddd665fc40fe2ee401b78486f2bceca4e237"
DEPENDS:append = " libyaml"

do_install:append() {
	install -d ${D}${sysconfdir}
	sed -e 's|@@UBOOT_ENV_SIZE@@|${UBOOT_ENV_SIZE}|' -e 's|@@UBOOT_STORAGE_DEVICE@@|${UBOOT_STORAGE_DEVICE}|' -e 's|@@UBOOT_ENV_ADDR@@|${UBOOT_ENV_ADDR}|'  -e 's|@@UBOOT_ENV_ADDR_REDUND@@|${UBOOT_ENV_ADDR_REDUND}|' "${WORKDIR}/fw_env.config.in" > "${WORKDIR}/fw_env.config"
	install -m 0644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.config
}
