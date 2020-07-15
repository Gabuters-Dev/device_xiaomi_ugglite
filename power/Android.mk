LOCAL_PATH := $(call my-dir)

ifeq ($(call is-vendor-board-platform,QCOM),true)

include $(CLEAR_VARS)

LOCAL_MODULE_RELATIVE_PATH := hw

LOCAL_SHARED_LIBRARIES := \
    liblog \
    libcutils \
    libdl \
    libbase \
    libhidlbase \
    libhidltransport \
    libhwbinder \
    libutils \
    android.hardware.power@1.2

LOCAL_HEADER_LIBRARIES := \
    libhardware_headers

LOCAL_SRC_FILES := \
    power-common.c \
    metadata-parser.c \
    utils.c \
    list.c \
    hint-data.c \
    service.cpp \
    Power.cpp

LOCAL_CFLAGS += -Wall -Wextra -Werror

ifneq ($(BOARD_POWER_CUSTOM_BOARD_LIB),)
    LOCAL_WHOLE_STATIC_LIBRARIES += $(BOARD_POWER_CUSTOM_BOARD_LIB)
else

# Include target-specific files.
LOCAL_SRC_FILES += power-8937.c

endif # End of board specific list

ifneq ($(TARGET_POWER_SET_FEATURE_LIB),)
    LOCAL_WHOLE_STATIC_LIBRARIES += $(TARGET_POWER_SET_FEATURE_LIB)
endif

ifneq ($(TARGET_POWERHAL_SET_INTERACTIVE_EXT),)
    LOCAL_CFLAGS += -DSET_INTERACTIVE_EXT
    LOCAL_SRC_FILES += ../../../../$(TARGET_POWERHAL_SET_INTERACTIVE_EXT)
endif

ifneq ($(TARGET_TAP_TO_WAKE_NODE),)
    LOCAL_CFLAGS += -DTAP_TO_WAKE_NODE=\"$(TARGET_TAP_TO_WAKE_NODE)\"
endif

ifeq ($(TARGET_USES_INTERACTION_BOOST),true)
    LOCAL_CFLAGS += -DINTERACTION_BOOST
endif

ifeq ($(TARGET_ARCH),arm)
    LOCAL_CFLAGS += -DARCH_ARM_32
endif

LOCAL_MODULE := android.hardware.power@1.2-service-qti.ugglite
LOCAL_INIT_RC := android.hardware.power@1.2-service-qti.ugglite.rc
LOCAL_MODULE_TAGS := optional
LOCAL_VENDOR_MODULE := true

include $(BUILD_EXECUTABLE)

endif
