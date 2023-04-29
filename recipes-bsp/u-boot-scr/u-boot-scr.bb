SUMMARY = "U-Boot boot script generator"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

DEPENDS = "u-boot-mkimage-native"

SRC_URI = "file://boot.cmd.in"

inherit deploy

ARCH:arm ?= "arm"
ARCH:aarch64 ?= "arm64"

BOOT_CMD:arm ?= "bootz"
BOOT_CMD:aarch64 ?= "booti"

do_compile() {
	sed -e 's|@@SWUPDATE_STORAGE_DEVICE@@|${SWUPDATE_STORAGE_DEVICE}|' -e 's|@@BOOT_CMD@@|${BOOT_CMD}|'  -e 's|@@UBOOT_FITIMAGE_ADDR@@|${UBOOT_FITIMAGE_ADDR}|' "${WORKDIR}/boot.cmd.in" > "${WORKDIR}/boot.cmd"
	mkimage -C none -A ${ARCH} -T script -d "${WORKDIR}/boot.cmd" boot.scr
}

do_deploy() {
	install -d ${DEPLOYDIR}
	install -m 0644 boot.scr ${DEPLOYDIR}
}

addtask do_deploy after do_compile before do_build

PACKAGE_ARCH = "${MACHINE_ARCH}"
