################################################################################
#
# Device-tree overlays to control Home Assistant Green LEDs
#
################################################################################

HA_GREEN_LED_OVERLAYS_VERSION = 1.0.0
HA_GREEN_LED_OVERLAYS_LICENSE = Apache License 2.0
HA_GREEN_LED_OVERLAYS_LICENSE_FILES = $(BR2_EXTERNAL_HASSOS_PATH)/../LICENSE
HA_GREEN_LED_OVERLAYS_SITE = $(BR2_EXTERNAL_HASSOS_PATH)/package/ha-green-led-overlays
HA_GREEN_LED_OVERLAYS_SITE_METHOD = local
HA_GREEN_LED_OVERLAYS_DEPENDENCIES = host-dtc

HA_GREEN_LED_OVERLAYS_DTS_FILES = ha-green-disable-led-power ha-green-disable-led-activity ha-green-disable-led-user

define HA_GREEN_LED_OVERLAYS_BUILD_CMDS
	$(foreach dts_file,$(HA_GREEN_LED_OVERLAYS_DTS_FILES),\
		$(HOST_DIR)/bin/dtc -@ -I dts -O dtb -W no-unit_address_vs_reg -o $(@D)/$(dts_file).dtbo $(BR2_EXTERNAL_HASSOS_PATH)/package/ha-green-led-overlays/$(dts_file).dts; \
	)
endef

HA_GREEN_LED_OVERLAYS_INSTALL_IMAGES = YES

define HA_GREEN_LED_OVERLAYS_INSTALL_IMAGES_CMDS
	$(foreach dts_file,$(HA_GREEN_LED_OVERLAYS_DTS_FILES),\
		$(INSTALL) -D -m 0644 $(@D)/$(dts_file).dtbo  $(BINARIES_DIR)/
	)
endef

$(eval $(generic-package))
