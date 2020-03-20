PRODUCT_KERNEL_VERSION := 5.4
BOARD_GENERIC_RAMDISK_KERNEL_MODULES += \
    $(wildcard prebuilts/qemu-kernel/x86_64/$(PRODUCT_KERNEL_VERSION)/ko/*.ko)

PRODUCT_PROPERTY_OVERRIDES += \
       vendor.rild.libpath=/vendor/lib/libgoldfish-ril.so

# This is a build configuration for a full-featured build of the
# Open-Source part of the tree. It's geared toward a US-centric
# build quite specifically for the emulator, and might not be
# entirely appropriate to inherit from for on-device configurations.
PRODUCT_COPY_FILES += \
    device/generic/goldfish/data/etc/config.ini.nexus5:config.ini \
    device/generic/goldfish/data/etc/advancedFeatures.ini:advancedFeatures.ini \
    device/generic/goldfish/data/etc/encryptionkey.img:encryptionkey.img \
    device/generic/goldfish/task_profiles.json:$(TARGET_COPY_OUT_VENDOR)/etc/task_profiles.json \
    prebuilts/qemu-kernel/x86_64/$(PRODUCT_KERNEL_VERSION)/kernel-qemu2:kernel-ranchu-64
PRODUCT_SDK_ADDON_COPY_FILES += \
    device/generic/goldfish/data/etc/advancedFeatures.ini:images/x86/advancedFeatures.ini \
    device/generic/goldfish/data/etc/encryptionkey.img:images/x86/encryptionkey.img \
    prebuilts/qemu-kernel/x86_64/$(PRODUCT_KERNEL_VERSION)/kernel-qemu2:images/x86/kernel-ranchu-64

PRODUCT_COPY_FILES += \
    device/generic/goldfish/data/etc/x86/emulatorip:$(TARGET_COPY_OUT_VENDOR)/bin/ip


PRODUCT_SHIPPING_API_LEVEL := 28
TARGET_USES_MKE2FS := true
