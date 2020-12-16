################################################################################
#
# Realtek RTL8812AU driver
#
################################################################################

RTL8812AU_VERSION = c48292877ca5fc9f893382c3ed6e8dedc3a7a1eb
RTL8812AU_SITE = $(call github,gnab,rtl8812au,$(RTL8812AU_VERSION))
RTL8812AU_LICENSE = GPL-2.0
RTL8812AU_LICENSE_FILES = COPYING
#RTL8812AU_MODULE_SUBDIRS = src

RTL8812AU_MODULE_MAKE_OPTS = \
	CONFIG_RTL8821AU=m CONFIG_RTL8812AU_8821AU=m \
	KVER=$(LINUX_VERSION_PROBED) \
	KSRC=$(LINUX_DIR)

$(eval $(kernel-module))
$(eval $(generic-package))
