FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " \
    file://hostapd.conf \
"

# Install configuration
do_install:append() {
	install -m 0644 ${WORKDIR}/hostapd.conf ${D}${sysconfdir}
}

SYSTEMD_AUTO_ENABLE:${PN} = "enable"
