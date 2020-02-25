#
# This policy configuration will be used by select legacy products that
# inherit from conquer
#

ifeq ($(TARGET_HAS_LEGACY_CAMERA_HAL1), true)
BOARD_PLAT_PUBLIC_SEPOLICY_DIR += \
    device/conquer/sepolicy/legacy-common/public/legacy-camera-hal1
endif
