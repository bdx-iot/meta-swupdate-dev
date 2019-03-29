FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://hostapd.conf \
"

# Install configuration
do_install_append() {
	install -m 0644 ${WORKDIR}/hostapd.conf ${D}${sysconfdir}
}

SYSTEMD_AUTO_ENABLE_${PN} = "enable"
