FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " \
    file://sensor.cfg \
    file://0001-arch-imx7s-warp-add-support-for-warp7-ynov-board.patch \
"
