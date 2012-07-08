$(call inherit-product, device/htc/primoc/primoc.mk)

## Specify phone tech before including full_phone
#$(call inherit-product, vendor/cm/config/cdma.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := primoc
PRODUCT_NAME := cm_primoc
PRODUCT_BRAND := HTC
PRODUCT_MODEL := HTC One V
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_primoc BUILD_FINGERPRINT=virgin_mobile/htc_primoc/primoc:4.0.3/IML74K/63812.6:user/release-keys PRIVATE_BUILD_DESC="1.08.652.6 CL63812 release-keys"

PRODUCT_RELEASE_NAME := primoc
-include vendor/cm/config/common_versions.mk