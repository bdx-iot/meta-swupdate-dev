FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI = "git://github.com/bdx-iot/swupdate.git;protocol=https;branch=topic/libubootenv_new_format \
    file://defconfig \
    file://swupdate \
    file://swupdate.sh \
    file://swupdate.service \
    file://swupdate.socket.tmpl \
    file://swupdate-usb.rules \
    file://swupdate-usb@.service \
    file://swupdate-progress.service \
    file://tmpfiles-swupdate.conf \
    file://10-mongoose-args \
    file://90-start-progress \
"

SRC_URI:append = " \
     file://swupdate.cfg.in \
     file://09-swupdate-args.in \
"

SRCREV = "8e76337494c6aff0e9de6dc27f994fedc72d78fa"

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
