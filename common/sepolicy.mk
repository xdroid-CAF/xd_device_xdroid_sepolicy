#
# This policy configuration will be used by all products that
# inherit from xdroid
#

ifeq ($(TARGET_COPY_OUT_VENDOR), vendor)
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
TARGET_USES_PREBUILT_VENDOR_SEPOLICY ?= true
endif
endif

BOARD_PLAT_PUBLIC_SEPOLICY_DIR += \
    device/xdroid/sepolicy/common/public

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/xdroid/sepolicy/common/private

ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/xdroid/sepolicy/common/dynamic

ifneq ($(TARGET_HAL_POWER_RW_INPUT_DEVICE), true)
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/xdroid/sepolicy/common/dynamic_extra
endif
else
BOARD_VENDOR_SEPOLICY_DIRS += \
    device/xdroid/sepolicy/common/dynamic \
    device/xdroid/sepolicy/common/dynamic_extra \
    device/xdroid/sepolicy/common/vendor
endif

# Selectively include legacy rules defined by the products
-include device/xdroid/sepolicy/legacy-common/sepolicy.mk
