#
# Copyright (C) 2011 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

#Toushcreen config files
PRODUCT_COPY_FILES += \
    device/htc/primoc/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
    device/htc/primoc/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc

#Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/primoc/primoc-vendor.mk)

#Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-htc \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.3_r3 \
    keyguard.no_require_sim=true \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    persist.sys.usb.config=mass_storage,rndis,adb \
    sys.media.vdec.sw=1

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

# Disable visual strict mode, even on eng builds
PRODUCT_DEFAULT_PROPERTY += \
persist.sys.strictmode.visual=0

DEVICE_PACKAGE_OVERLAYS += device/htc/primoc/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \

# Misc
PRODUCT_PACKAGES += \
    lights.primoc \
    sensors.primoc \
    gps.primoc \
    audio_policy.msm7x30 \
    audio.primary.msm7x30 \
    audio.a2dp.default \
    libaudioutils \
    libtinyalsa \
    com.android.future.usb.accessory

# Video
PRODUCT_PACKAGES += \
    copybit.msm7x30 \
    gralloc.msm7x30 \
    hwcomposer.msm7x30 \
    libgenlock \
    libmemalloc \
    libQcomUI \
    libtilerenderer \
    liboverlay


# Omx
PRODUCT_PACKAGES += \
    libOmxCore \
    libOmxVenc \
    libOmxVdec

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    NoiseField \
    PhaseBeam \
    MagicSmoke \
    Galaxy4 \
    HoloSpiralWallpaper \
    librs_jni


# missing packages
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \
    Mms \
    Stk \
    Superuser \
    Trebuchet \
    su

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/primoc/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/primoc/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/primoc/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
	device/htc/primoc/keylayout/himax-touchscreen.kl:system/usr/keylayout/himax-touchscreen.kl
    device/htc/primoc/keylayout/primoc-keypad.kl:system/usr/keylayout/primoc-keypad.kl

# Firmware
PRODUCT_COPY_FILES += \
    device/htc/primoc/firmware/fw_bcm4329.bin:system/vendor/firmware/fw_bcm4329.bin \
    device/htc/primoc/firmware/fw_bcm4329_apsta.bin:system/vendor/firmware/fw_bcm4329_apsta.bin \
    device/htc/primoc/firmware/fw_bcm4329_p2p.bin:system/vendor/firmware/fw_bcm4329_p2p.bin \
    device/htc/primoc/firmware/default.acdb:system/etc/firmware/default.acdb \
    device/htc/primoc/firmware/default_org.acdb:system/etc/firmware/default_org.acdb \
    device/htc/primoc/firmware/vidc_720p_command_control.fw:system/etc/firmware/vidc_720p_command_control.fw \
    device/htc/primoc/firmware/vidc_720p_h263_dec_mc.fw:system/etc/firmware/vidc_720p_h263_dec_mc.fw \
    device/htc/primoc/firmware/vidc_720p_h264_dec_mc.fw:system/etc/firmware/vidc_720p_h264_dec_mc.fw \
    device/htc/primoc/firmware/vidc_720p_h264_enc_mc.fw:system/etc/firmware/vidc_720p_h264_enc_mc.fw \
    device/htc/primoc/firmware/vidc_720p_mp4_dec_mc.fw:system/etc/firmware/vidc_720p_mp4_dec_mc.fw \
    device/htc/primoc/firmware/vidc_720p_mp4_enc_mc.fw:system/etc/firmware/vidc_720p_mp4_enc_mc.fw \
    device/htc/primoc/firmware/vidc_720p_vc1_dec_mc.fw:system/etc/firmware/vidc_720p_vc1_dec_mc.fw \
    device/htc/primoc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    device/htc/primoc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
    device/htc/primoc/firmware/leia_pfp_470.fw:system/etc/firmware/leia_pfp_470.fw \
    device/htc/primoc/firmware/leia_pm4_470.fw:system/etc/firmware/leia_pm4_470.fw \
    device/htc/primoc/gps.conf:system/etc/gps.conf

# Audio DSP Profiles
PRODUCT_COPY_FILES += \
    device/htc/primoc/dsp/AIC3254_REG.csv:system/etc/AIC3254_REG.csv \
    device/htc/primoc/dsp/AIC3254_REG_XD.csv:system/etc/AIC3254_REG_XD.csv \
    device/htc/primoc/dsp/AdieHWCodec.csv:system/etc/AdieHWCodec.csv \
    device/htc/primoc/dsp/CodecDSPID.txt:system/etc/CodecDSPID.txt \
    device/htc/primoc/dsp/HP_Audio.csv:system/etc/HP_Audio.csv \
    device/htc/primoc/dsp/HP_Video.csv:system/etc/HP_Video.csv \
    device/htc/primoc/dsp/SPK_Combination.csv:system/etc/SPK_Combination.csv \
    device/htc/primoc/dsp/soundimage/Sound_Bass_Booster.txt:system/etc/soundimage/Sound_Bass_Booster.txt \
    device/htc/primoc/dsp/soundimage/Sound_Blues.txt:system/etc/soundimage/Sound_Blues.txt \
    device/htc/primoc/dsp/soundimage/Sound_Classical.txt:system/etc/soundimage/Sound_Classical.txt \
    device/htc/primoc/dsp/soundimage/Sound_Country.txt:system/etc/soundimage/Sound_Country.txt \
    device/htc/primoc/dsp/soundimage/Sound_Dolby_A_HP.txt:system/etc/soundimage/Sound_Dolby_A_HP.txt \
    device/htc/primoc/dsp/soundimage/Sound_Dolby_A_SPK.txt:system/etc/soundimage/Sound_Dolby_A_SPK.txt \
    device/htc/primoc/dsp/soundimage/Sound_Dolby_V_HP.txt:system/etc/soundimage/Sound_Dolby_V_HP.txt \
    device/htc/primoc/dsp/soundimage/Sound_Dolby_V_SPK.txt:system/etc/soundimage/Sound_Dolby_V_SPK.txt \
    device/htc/primoc/dsp/soundimage/Sound_Dualmic.txt:system/etc/soundimage/Sound_Dualmic.txt \
    device/htc/primoc/dsp/soundimage/Sound_Dualmic_EP.txt:system/etc/soundimage/Sound_Dualmic_EP.txt \
    device/htc/primoc/dsp/soundimage/Sound_Dualmic_SPK.txt:system/etc/soundimage/Sound_Dualmic_SPK.txt \
    device/htc/primoc/dsp/soundimage/Sound_Jazz.txt:system/etc/soundimage/Sound_Jazz.txt \
    device/htc/primoc/dsp/soundimage/Sound_Latin.txt:system/etc/soundimage/Sound_Latin.txt \
    device/htc/primoc/dsp/soundimage/Sound_New_Age.txt:system/etc/soundimage/Sound_New_Age.txt \
    device/htc/primoc/dsp/soundimage/Sound_Original.txt:system/etc/soundimage/Sound_Original.txt \
    device/htc/primoc/dsp/soundimage/Sound_Original_SPK.txt:system/etc/soundimage/Sound_Original_SPK.txt \
    device/htc/primoc/dsp/soundimage/Sound_Piano.txt:system/etc/soundimage/Sound_Piano.txt \
    device/htc/primoc/dsp/soundimage/Sound_Pop.txt:system/etc/soundimage/Sound_Pop.txt \
    device/htc/primoc/dsp/soundimage/Sound_R_B.txt:system/etc/soundimage/Sound_R_B.txt \
    device/htc/primoc/dsp/soundimage/Sound_Rock.txt:system/etc/soundimage/Sound_Rock.txt \
    device/htc/primoc/dsp/soundimage/Sound_SRS_A_HP.txt:system/etc/soundimage/Sound_SRS_A_HP.txt \
    device/htc/primoc/dsp/soundimage/Sound_SRS_A_SPK.txt:system/etc/soundimage/Sound_SRS_A_SPK.txt \
    device/htc/primoc/dsp/soundimage/Sound_SRS_V_HP.txt:system/etc/soundimage/Sound_SRS_V_HP.txt \
    device/htc/primoc/dsp/soundimage/Sound_SRS_V_SPK.txt:system/etc/soundimage/Sound_SRS_V_SPK.txt \
    device/htc/primoc/dsp/soundimage/Sound_Treble_Booster.txt:system/etc/soundimage/Sound_Treble_Booster.txt \
    device/htc/primoc/dsp/soundimage/Sound_Vocal_Booster.txt:system/etc/soundimage/Sound_Vocal_Booster.txt

PRODUCT_COPY_FILES += \
    device/htc/primoc/vold.fstab:system/etc/vold.fstab

PRODUCT_COPY_FILES += \
    device/htc/primoc/modules/bcm4329.ko:system/lib/modules/bcm4329.ko

LOCAL_KERNEL := device/htc/primoc/kernel/kernel

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full_base.mk)

# we have enough storage spprimoc to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# use high-density artwork where available
PRODUCT_LOCALES += hdpi

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# htc audio settings
$(call inherit-product, device/htc/primoc/media_htcaudio.mk)
