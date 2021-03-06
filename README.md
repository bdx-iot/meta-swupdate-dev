This README file contains information on the contents of the meta-swupdate-dev layer.

Please see the corresponding sections below for details.

Supported boards:
========

```
imx7s-warp
imx7d-pico
stm32mp157a-dk1
stm32mp157c-dk2
```

Build
============
Install the `kas` utility:

```
$: pip3 --user install kas
$: mkdir swupdate
$: git clone https://github.com/bdx-iot/meta-swupdate-dev
$: kas build meta-swupdate-dev/kas:meta-swupdate-dev/board-<machine-name>.yml
```
After a successful build, the images and build artifacts are placed in `tmp/deploy/images/<machine-name>/`.

* `tmp/deploy/images/<machine-name>/base-image-swupdate-image-<machine-name>.wic.gz`

* `tmp/deploy/images/<machine-name>/base-image-swupdate-image-<machine-name>.wic.bmap`

* `tmp/deploy/images/<machine-name>/update-image-<machine-name>.swu`

Flash image
========
```
sudo bmaptool copy base-image-swupdate-<machine-name>.wic.gz /dev/sdX
```

or build the bmap native tool (done once)

```
bitbake bmap-tools-native -c addto_recipe_sysroot
```

and insert your SD Card to flash the image:

```
oe-run-native bmap-tools-native bmaptool copy tmp/deploy/images/<machine-name>/base-image-swupdate-<machine-name>.wic.gz /dev/sdX
```
