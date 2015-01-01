$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, device/lge/p500/device.mk)
$(call inherit-product-if-exists, vendor/lge/p500/p500-vendor.mk)

$(call inherit-product, vendor/qcom/msm7x27/qcom-vendor.mk)
$(call inherit-product, vendor/lge/msm7x27-common/msm7x27-common-vendor-blobs.mk)

# See extras.txt (Gallery2, Provision, QuickSearchBox)
$(call inherit-product-if-exists, vendor/google/gapps.mk)

PRODUCT_NAME := p500
PRODUCT_DEVICE := p500
PRODUCT_BRAND := lge
PRODUCT_MODEL := LG-P500
PRODUCT_MANUFACTURER := LGE

