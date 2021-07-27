################################################################################
#
# ap6398s-firmware
#
################################################################################

AP6398S_FIRMWARE_VERSION = 3ddc301c272f081aa5513c1934f6d530bf80de4a
AP6398S_FIRMWARE_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware,$(AP6398S_FIRMWARE_VERSION))
#AP6398S_FIRMWARE_SITE = https://github.com/LibreELEC/brcmfmac_sdio-firmware
AP6398S_FIRMWARE_LICENSE = unknown

AP6398S_FIRMWARE_FILES = \
	BCM4359C0.hcd \
	brcmfmac4359-sdio.bin \
	brcmfmac4359-sdio.txt \
	brcmfmac4359-sdio.khadas,vim3.txt \
	brcmfmac4359-sdio.khadas,vim3l.txt

define AP6398S_FIRMWARE_INSTALL_TARGET_CMDS
	$(foreach f,$(AP6398S_FIRMWARE_FILES), \
		$(INSTALL) -m 0644 -D $(@D)/$(f) \
			$(TARGET_DIR)/lib/firmware/brcm/$(f)
	)
endef

$(eval $(generic-package))
