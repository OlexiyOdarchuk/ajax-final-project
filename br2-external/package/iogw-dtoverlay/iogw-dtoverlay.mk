################################################################################
#
# iogw-dtoverlay
#
################################################################################

IOGW_DTOVERLAY_VERSION = 1.0
IOGW_DTOVERLAY_SITE = $(BR2_EXTERNAL_IOGW_PATH)/../dts
IOGW_DTOVERLAY_SITE_METHOD = local
IOGW_DTOVERLAY_LICENSE = GPL-2.0
IOGW_DTOVERLAY_DEPENDENCIES = host-dtc rpi-firmware
IOGW_DTOVERLAY_INSTALL_TARGET = NO
IOGW_DTOVERLAY_INSTALL_IMAGES = YES

# -@ keeps symbols so the firmware can resolve &spi0, &i2c_arm, ... at boot
define IOGW_DTOVERLAY_BUILD_CMDS
	$(HOST_DIR)/bin/dtc -@ -Wno-unit_address_vs_reg -I dts -O dtb \
		-o $(@D)/iogw.dtbo $(@D)/iogw-overlay.dts
endef

define IOGW_DTOVERLAY_INSTALL_IMAGES_CMDS
	$(INSTALL) -D -m 0644 $(@D)/iogw.dtbo \
		$(BINARIES_DIR)/rpi-firmware/overlays/iogw.dtbo
endef

$(eval $(generic-package))
