require recipes-core/images/core-image-base.bb

SUMMARY = "Base Image Swupdate  (Test)"

inherit image-buildinfo

IMAGE_FEATURES_append = " \
	ssh-server-dropbear \
"

# Misc
IMAGE_INSTALL_append = " \
	openssh-sftp-server \
	iptables \
	curl \
	can-utils \
	iproute2 \
	i2c-tools \
	libgpiod-tools \
	spitools \
	cryptsetup \
	parted \
	e2fsprogs-e2fsck \
	e2fsprogs-resize2fs \
	e2fsprogs-mke2fs \
"

# SWUpdate
IMAGE_INSTALL_append = " \
	lua \
	librsync \
	swupdate \
	swupdate-www \
	swupdate-tools \
	libubootenv-bin \
"

# Kernel
IMAGE_INSTALL_append = " \
	kernel-image \
	kernel-devicetree \
	kernel-modules \
	haveged \
	packagegroup-base \
"

IMAGE_INSTALL_append_imx7d-pico = "\
	dnsmasq \
	hostapd \
"

# U-Boot initial env
IMAGE_INSTALL_append_imx = "\
	u-boot-fslc-initial-env \
"

IMAGE_INSTALL_append_stm32mp1 = "\
	u-boot-initial-env \
"

IMAGE_BUILDINFO_VARS = " \
    BB_VERSION \
    BUILD_SYS  \
    NATIVELSBSTRING \
    TARGET_SYS \
    MACHINE \
    DISTRO \
    DISTRO_VERSION \
    TUNE_FEATURES \
    TARGET_FPU \
"

buildinfo () {
cat > ${IMAGE_ROOTFS}${sysconfdir}/${MACHINE}-build-info << END
Build Configuration:
${@buildinfo_target(d)}
${@get_layer_revs(d)}
END
}	

export IMAGE_BASENAME = "base-image-swupdate"
