FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRCBRANCH = "master"
SRC_URI:append = " \
     file://swupdate.cfg.in \
     file://09-swupdate-args.in \
"

SRCREV = "909195ef70eb93419c1487d6eb8036571b8027c5"

do_install:append() {
    install -d ${D}/data
    sed -e 's|@@SWUPDATE_HAWKBIT_ID@@|${SWUPDATE_HAWKBIT_ID}|' -e 's|@@SWUPDATE_HARDWARE_COMPATIBILITY@@|${SWUPDATE_HARDWARE_COMPATIBILITY}|' -e 's|@@SWUPDATE_HARWARE_REVISION@@|${SWUPDATE_HARWARE_REVISION}|' -e 's|@@SWUPDATE_HAWKBIT_TENANT@@|${SWUPDATE_HAWKBIT_TENANT}|' -e 's|@@SWUPDATE_HAWKBIT_GATEWAY_TOKEN@@|${SWUPDATE_HAWKBIT_GATEWAY_TOKEN}|' -e 's|@@SWUPDATE_HAWKBIT_SERVER@@|${SWUPDATE_HAWKBIT_SERVER}|' "${WORKDIR}/swupdate.cfg.in" > "${WORKDIR}/swupdate.cfg"
    install -m 644 ${WORKDIR}/swupdate.cfg ${D}/data

    install -d ${D}${sysconfdir}
    sed -e 's|@@SWUPDATE_ROOTFS_A@@|${SWUPDATE_ROOTFS_A}|' -e 's|@@SWUPDATE_HARDWARE_COMPATIBILITY@@|${SWUPDATE_HARDWARE_COMPATIBILITY}|' -e 's|@@SWUPDATE_HARWARE_REVISION@@|${SWUPDATE_HARWARE_REVISION}|' "${WORKDIR}/09-swupdate-args.in" > "${WORKDIR}/09-swupdate-args"
    install -m 755 ${WORKDIR}/09-swupdate-args ${D}${libdir}/swupdate/conf.d/
}

# We don't want to run this service if IMAGE_FEATURES doesn't contains splash
SYSTEMD_AUTO_ENABLE:${PN}-progress = "${@bb.utils.contains('IMAGE_FEATURES', 'splash', 'enable', 'disable', d)}"
FILES:${PN}:append = " /data/swupdate.cfg"
