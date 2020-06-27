require recipes-core/images/core-image-base.bb

SUMMARY = "Base Image Swupdate  (Test)"

inherit image-buildinfo

IMAGE_FEATURES:append = " \
	ssh-server-dropbear \
"

# Misc
IMAGE_INSTALL:append = " \
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
IMAGE_INSTALL:append = " \
	lua \
	librsync \
	swupdate \
	swupdate-www \
	swupdate-tools-ipc \
	libubootenv-bin \
"

# Kernel
IMAGE_INSTALL:append = " \
	kernel-image \
	kernel-devicetree \
	kernel-modules \
	haveged \
	packagegroup-base \
"

IMAGE_INSTALL:append:imx7d-pico = "\
	dnsmasq \
	hostapd \
"

# U-Boot initial env
IMAGE_INSTALL:append:imx = "\
	u-boot-fslc-env \
"

IMAGE_INSTALL:append:stm32mp1 = "\
	u-boot-env \
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
