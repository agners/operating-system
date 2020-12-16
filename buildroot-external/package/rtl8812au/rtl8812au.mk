################################################################################
#
# Realtek RTL8812AU driver
#
################################################################################

RTL8812AU_VERSION = b95e75064d6aa5b680049a3fe63b2131a3033e3e
RTL8812AU_SITE = $(call github,gordboy,rtl8812au-5.9.3.2,$(RTL8812AU_VERSION))
RTL8812AU_LICENSE = GPL-2.0
RTL8812AU_LICENSE_FILES = COPYING
#RTL8812AU_MODULE_SUBDIRS = src

RTL8812AU_MODULE_MAKE_OPTS = \
	CONFIG_RTL8812AU=m \
	KVER=$(LINUX_VERSION_PROBED) \
	KSRC=$(LINUX_DIR)

$(eval $(kernel-module))
$(eval $(generic-package))
