FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
	file://wifi.network \
	file://wifi-hostpot.network \
	file://eth.network \
	file://rndis.network \
"

do_install_append_imx7s-warp() {
	install -m 0644 ${WORKDIR}/wifi.network ${D}${sysconfdir}/systemd/network/
	install -m 0644 ${WORKDIR}/eth.network ${D}${sysconfdir}/systemd/network/
	install -m 0644 ${WORKDIR}/rndis.network ${D}${sysconfdir}/systemd/network/
}

do_install_append_imx7d-pico() {
	install -m 0644 ${WORKDIR}/wifi-hostpot.network ${D}${sysconfdir}/systemd/network/
	install -m 0644 ${WORKDIR}/eth.network ${D}${sysconfdir}/systemd/network/
	install -m 0644 ${WORKDIR}/rndis.network ${D}${sysconfdir}/systemd/network/
}
