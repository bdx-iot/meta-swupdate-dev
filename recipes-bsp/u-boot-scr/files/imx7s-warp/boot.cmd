setenv bootargs 'console=${console},${baudrate} root=/dev/mmcblk1p'${rootpart}' rootwait rw'
run swu_setup
load mmc 0:${rootpart} 0x86000000 /boot/fitImage
bootm 0x86000000
