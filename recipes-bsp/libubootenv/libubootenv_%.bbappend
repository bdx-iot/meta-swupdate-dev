FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " \
	file://fw_env.config.in \
"
UBOOT_STORAGE_DEVICE ??= "/dev/mmcblk0"
UBOOT_ENV_ADDR ??= ""
UBOOT_ENV_ADDR_REDUND ??= ""
UBOOT_ENV_SIZE ??= "0x2000"

do_install:append() {
	install -d ${D}${sysconfdir}
	sed -e 's|@@UBOOT_ENV_SIZE@@|${UBOOT_ENV_SIZE}|' -e 's|@@UBOOT_STORAGE_DEVICE@@|${UBOOT_STORAGE_DEVICE}|' -e 's|@@UBOOT_ENV_ADDR@@|${UBOOT_ENV_ADDR}|'  -e 's|@@UBOOT_ENV_ADDR_REDUND@@|${UBOOT_ENV_ADDR_REDUND}|' "${WORKDIR}/fw_env.config.in" > "${WORKDIR}/fw_env.config"
	install -m 0644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.config
}
