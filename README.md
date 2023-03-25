# Forked Home Assistant Operating System repository for the Orange Pi 4 LTS 3GB RAM/eMMC variant

- Added defconfig for Orange Pi 4 LTS: buildroot-external/configs/opi4-lts_defconfig
- Added manufacturer directory: buildroot-external/board/orangepi/
- Added board specific config: buildroot-external/board/orangepi/orangepi-4-lts/
- Added linux patches for board support (rk3399-orangepi-4-lts.dtb) and ethernet: buildroot-external/board/orangepi/patches/linux/
  - 0001-arm64-dts-rockchip-add-OrangePi-4-LTS.patch
  - 0002-Add-UT8531C-phy-support.patch - From manjaro-arm: 1025-Add-YT8531C-phy-support.patch
- Added u-boot patches from manjaro for u-boot 2022.04 in buildroot-external/patches/uboot/ (from https://gitlab.manjaro.org/manjaro-arm/packages/core/uboot-orangepi4-lts/-/tree/main/)
  - 0002-add-arm64-dts-rockchip-orangepi-4-lts.patch
  - 0003-mmc-sdhci-allow-disabling-sdma-in-spl.patch
- Specified fdtfile=rk3399-orangepi-4-lts.dtb in /buildroot-external/board/orangepi/orangepi-4-lts/boot-env.txt
- Updated board defconfig kernel version to 6.1.19
- Set 'CONFIG_MOTORCOMM_PHY=y' in buildroot-external/kernel/device-support.config for ethernet support

# Current issues:

- Will only boot from SD card if eMMC bootloader is wiped: use armbian booted from sdcard to execute: dd if=/dev/zero of=/dev/mmcblk0 bs=1M count=10
- Boots into HAOS 9.5
- No wifi or bluetooth, requires firmware for uwe5622

# Working:

- HDMI output
- Ethernet

# Home Assistant Operating System

Home Assistant Operating System (formerly HassOS) is a Linux based operating system optimized to host [Home Assistant](https://www.home-assistant.io) and its [Add-ons](https://www.home-assistant.io/addons/).

Home Assistant Operating System uses Docker as Container engine. It by default deploys the Home Assistant Supervisor as a container. Home Assistant Supervisor in turn uses the Docker container engine to control Home Assistant Core and Add-Ons in separate containers. Home Assistant Operating System is **not** based on a regular Linux distribution like Ubuntu. It is built using [Buildroot](https://buildroot.org/) and it is optimized to run Home Assistant. It targets single board compute (SBC) devices like the Raspberry Pi or ODROID but also supports x86-64 systems with UEFI.

## Features

- Lightweight and memory-efficient
- Minimized I/O
- Over The Air (OTA) updates
- Offline updates
- Modular using Docker container engine

## Supported hardware

- Raspberry Pi
- Hardkernel ODROID
- Asus Tinker Board
- Generic x86-64 (e.g. Intel NUC)
- Virtual appliances

See the full list and specific models [here](./Documentation/boards/README.md)

## Getting Started

If you just want to use Home Assistant the official [getting started guide](https://www.home-assistant.io/getting-started/) and [installation instructions](https://www.home-assistant.io/hassio/installation/) take you through how to download Home Assistant Operating System and get it running on your machine.

If you're interested in finding out more about Home Assistant Operating System and how it works read on...

## Development

If you don't have experience with embedded systems, Buildroot or the build process for Linux distributions it is recommended to read up on these topics first (e.g. [Bootlin](https://bootlin.com/docs/) has excellent resources).

The Home Assistant Operating System documentation can be found on the [Home Assistant Developer Docs website](https://developers.home-assistant.io/docs/operating-system).

### Components

- **Bootloader:**
  - [Barebox](https://barebox.org/) for devices that support UEFI
  - [U-Boot](https://www.denx.de/wiki/U-Boot) for devices that don't support UEFI
- **Operating System:**
  - [Buildroot](https://buildroot.org/) LTS Linux
- **File Systems:**
  - [SquashFS](https://www.kernel.org/doc/Documentation/filesystems/squashfs.txt) for read-only file systems (using LZ4 compression)
  - [ZRAM](https://www.kernel.org/doc/Documentation/blockdev/zram.txt) for `/tmp`, `/var` and swap (using LZ4 compression)
- **Container Platform:**
  - [Docker Engine](https://docs.docker.com/engine/) for running Home Assistant components in containers
- **Updates:**
  - [RAUC](https://rauc.io/) for Over The Air (OTA) and USB updates
- **Security:**
  - [AppArmor](https://apparmor.net/) Linux kernel security module

### Development builds

The Development build GitHub Action Workflow is a manually triggered workflow
which creates Home Assistant OS development builds. The development builds are
available at [os-builds.home-assistant.io](https://os-builds.home-assistant.io/).
