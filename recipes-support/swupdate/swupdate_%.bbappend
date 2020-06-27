FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " \
     file://swupdate.cfg.in \
     file://09-swupdate-args.in \
"

SWUPDATE_DEVICE_NAME ??= "${MACHINE}"
SWUPDATE_DEVICE_HARDWARE_REV ??= ""
SWUPDATE_FIRST_ROOTPART ??= ""
SWUPDATE_HAWKBIT_SERVER ??= "https://hawkbit.eclipseprojects.io"
SWUPDATE_HAWKBIT_GATEWAY_TOKEN ??= ""
SWUPDATE_HAWKBIT_TENANT ??= "default"
SWUPDATE_HAWKBIT_ID ??= "1"

do_install:append() {
    install -d ${D}/data
    sed -e 's|@@SWUPDATE_HAWKBIT_ID@@|${SWUPDATE_HAWKBIT_ID}|' -e 's|@@SWUPDATE_DEVICE_NAME@@|${SWUPDATE_DEVICE_NAME}|' -e 's|@@SWUPDATE_DEVICE_HARDWARE_REV@@|${SWUPDATE_DEVICE_HARDWARE_REV}|' -e 's|@@SWUPDATE_HAWKBIT_TENANT@@|${SWUPDATE_HAWKBIT_TENANT}|' -e 's|@@SWUPDATE_HAWKBIT_GATEWAY_TOKEN@@|${SWUPDATE_HAWKBIT_GATEWAY_TOKEN}|' -e 's|@@SWUPDATE_HAWKBIT_SERVER@@|${SWUPDATE_HAWKBIT_SERVER}|' "${WORKDIR}/swupdate.cfg.in" > "${WORKDIR}/swupdate.cfg"
    install -m 644 ${WORKDIR}/swupdate.cfg ${D}/data

    install -d ${D}${sysconfdir}
    sed -e 's|@@SWUPDATE_FIRST_ROOTPART@@|${SWUPDATE_FIRST_ROOTPART}|' -e 's|@@SWUPDATE_DEVICE_NAME@@|${SWUPDATE_DEVICE_NAME}|' -e 's|@@SWUPDATE_DEVICE_HARDWARE_REV@@|${SWUPDATE_DEVICE_HARDWARE_REV}|' "${WORKDIR}/09-swupdate-args.in" > "${WORKDIR}/09-swupdate-args"
    install -m 755 ${WORKDIR}/09-swupdate-args ${D}${libdir}/swupdate/conf.d/
}

# We don't want to run this service
SYSTEMD_AUTO_ENABLE:${PN}-progress = "disable"
FILES:${PN}:append = " /data/swupdate.cfg"
