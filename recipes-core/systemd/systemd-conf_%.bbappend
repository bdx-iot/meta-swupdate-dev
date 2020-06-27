FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " \
	file://wifi.network \
	file://wifi-hostpot.network \
	file://eth.network \
	file://rndis.network \
"

do_install:append:imx7s-warp() {
	install -Dm 0644 ${WORKDIR}/wifi.network ${D}${systemd_unitdir}/network/wifi.network
	install -Dm 0644 ${WORKDIR}/eth.network ${D}${systemd_unitdir}/network/eth.network
	install -Dm 0644 ${WORKDIR}/rndis.network ${D}${systemd_unitdir}/network/rndis.network
}

do_install:append:imx7d-pico() {
	install -Dm 0644 ${WORKDIR}/wifi-hostpot.network ${D}${systemd_unitdir}/network/wifi-hostpot.network
	install -Dm 0644 ${WORKDIR}/eth.network ${D}${systemd_unitdir}/network/eth.network
	install -Dm 0644 ${WORKDIR}/rndis.network ${D}${systemd_unitdir}/network/rndis.network
}
