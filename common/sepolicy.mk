#
# This policy configuration will be used by all products that
# inherit from xdroid
#

ifeq ($(TARGET_COPY_OUT_VENDOR), vendor)
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
TARGET_USES_PREBUILT_VENDOR_SEPOLICY ?= true
endif
endif

SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += \
    device/xdroid/sepolicy/common/public

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/xdroid/sepolicy/common/private

ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/xdroid/sepolicy/common/dynamic
endif

BOARD_VENDOR_SEPOLICY_DIRS += \
    device/xdroid/sepolicy/common/dynamic \
    device/xdroid/sepolicy/common/vendor

# Selectively include legacy rules defined by the products
-include device/xdroid/sepolicy/legacy-common/sepolicy.mk
