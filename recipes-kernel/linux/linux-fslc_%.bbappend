FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_imx7d-pico = "\
    ${@bb.utils.contains('${USE_VIDEO}', \
    '1', \
    'file://0001-linux-fslc-imx7d-pico-Disable-panel.patch', \
    '', \
    d)}"
