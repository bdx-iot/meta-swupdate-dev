setenv bootargs 'console=${console},${baudrate} root=/dev/mmcblk1p'${rootpart}' rootwait rw'
run swu_setup
load mmc 0:${rootpart} ${loadaddr} /boot/${image}
load mmc 0:${rootpart} ${fdt_addr} /boot/${fdt_file}
bootz ${loadaddr} - ${fdt_addr}
