This README file contains information on the contents of the meta-swupdate-dev layer.

Please see the corresponding sections below for details.

I. Download BSP
============
To get the BSP you need to have `repo` installed and use it as:

Install the `repo` utility:

```
$: mkdir ~/bin
$: curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
$: chmod a+x ~/bin/repo
```
Download the Swupdate-dev BSP source:

```
$: PATH=${PATH}:~/bin
$: mkdir swupdate-bsp
$: cd swupdate-bsp
$: repo init -u https://github.com/bdx-iot/meta-swupdate-dev -b master -m scripts/default.xml
$: repo sync -j${nproc}
```
At the end of the commands you have every metadata you need to start work with.

II. Build
=======

To start a simple image build :

```
$: MACHINE=imx7s-warp DISTRO=poky source setup-environment swupdate-build
```

Generate image :

```
$: bitbake base-image-swupdate
```

Build output :

After a successful build, the images and build artifacts are placed in `tmp/deploy/images/<machine-name>/`.

* `tmp/deploy/images/<machine-name>/base-image-swupdate-image-<machine-name>.wic.gz`

* `tmp/deploy/images/<machine-name>/base-image-swupdate-image-<machine-name>.wic.bmap`

III. Flash image
========
```
sudo bmaptool copy base-image-swupdate-<machine-name>.wic.gz /dev/sdX
```