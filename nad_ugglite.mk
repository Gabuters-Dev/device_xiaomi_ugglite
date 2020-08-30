#
# Copyright (C) 2016 The CyanogenMod Project
#               2017-2019 The LineageOS Project
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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_m.mk)

# Inherit some common NusantaraOS stuff
$(call inherit-product, vendor/nusantara/config/common_full_phone.mk)

# Inherit from ugglite device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

TARGET_BOOT_ANIMATION_RES := 720

PRODUCT_BRAND := Xiaomi
PRODUCT_DEVICE := ugglite
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := Redmi Note 5A
PRODUCT_NAME := nad_ugglite

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

TARGET_VENDOR_PRODUCT_NAME := ugglite

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE="ugglite" \
    PRODUCT_NAME="ugglite" \
    PRIVATE_BUILD_DESC="flame-user 10 QQ3A.200805.001 6578210 release-keys"

BUILD_FINGERPRINT := "google/flame/flame:10/QQ3A.200805.001/6578210:user/release-keys"
