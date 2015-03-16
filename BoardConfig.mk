-include vendor/lge/p500/BoardConfigVendor.mk
-include device/lge/msm7x27-common/BoardConfigCommon.mk

TARGET_BOOTLOADER_BOARD_NAME    := p500
TARGET_OTA_ASSERT_DEVICE        := thunderg,p500
BOARD_KERNEL_CMDLINE            := mem=471M console=ttyMSM2,115200n8 androidboot.hardware=p500 no_console_suspend

ifneq (eng,$(TARGET_BUILD_VARIANT))
# Don't include charger detection in recovery mode
TARGET_KERNEL_CONFIG                := cyanogenmod_p500_defconfig
BOARD_CHARGING_CMDLINE_NAME         := "lge.reboot"
BOARD_CHARGING_CMDLINE_VALUE        := "pwroff"
else
# Real recovery size 0x00500000. Use lzma.
TARGET_KERNEL_CONFIG                := cyanogenmod_p500_recovery_defconfig
BOARD_RECOVERYIMAGE_PARTITION_SIZE  := 5242880
MINIGZIP                            := $(shell which lzma)
endif

BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lge/p500/bluetooth

TARGET_PROVIDES_INIT_RC := true

# Disabling skia-gpu for now while GL isn't 100% functional.
GECKO_CONFIGURE_ARGS := \
	--with-arch=armv6 \
	--disable-b2g-bt \
	--disable-b2g-ril \
	--disable-skia-gpu

BOARD_GAIA_MAKE_FLAGS := NOFTU=1 NO_LOCK_SCREEN=1 # GAIA_MEMORY_PROFILE=low ?
