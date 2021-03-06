# Grouper props root
GROUPER_PROPS_ROOT=vendor/shiny/proprietary/grouper

# Current method to pass device name to installer
export AOSP_INTENDED_DEVICE=grouper
	
# Inherit common Shiny configuration.
$(call inherit-product, vendor/shiny/products/shiny_common.mk)

# Inherit common Shiny tablet configuration.
$(call inherit-product, vendor/shiny/products/shiny_common_tablet.mk)

# Inherit AOSP device configuration for grouper.
$(call inherit-product, device/asus/grouper/aosp_grouper.mk)

# Grouper's custom kernel path
TARGET_PREBUILT_KERNEL := kernel/asus/grouper/arch/arm/boot/zImage

# Setup device specific product configuration
PRODUCT_NAME := shiny_grouper
PRODUCT_BRAND := google
PRODUCT_DEVICE := grouper
PRODUCT_MODEL := Nexus 7
PRODUCT_MANUFACTURER := asus

# Import Shiny's grouper overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/shiny/overlay/grouper

# The correct size boot animation for tuna devices
# TODO: In the future, this should be done in common.mk with some kind of 
# coded determination of screen size and selection of the appropriate bootanimation
PRODUCT_COPY_FILES += \
	$(GROUPER_PROPS_ROOT)/media/bootanimation.zip:system/media/bootanimation.zip \
	$(GROUPER_PROPS_ROOT)/app/CameraLauncher.apk:system/app/CameraLauncher.apk

# Override some build.prop settings for grouper
PRODUCT_BUILD_PROP_OVERRIDES += \
	PRODUCT_NAME=nakasi \
	BUILD_NUMBER=1158763 \
	BUILD_FINGERPRINT="google/nakasi/grouper:4.4.3/KTU84M/1158763:user/release-keys" \
	PRIVATE_BUILD_DESC="nakasi-user 4.4.3 KTU84M 1158763 release-keys"
	
PRODUCT_PROPERTY_OVERRIDES += \
    ro.media.effect.bgdropper.adj=0.2 \
	camera.flash_off=0 \
	ro.setupwizard.network_required=true
