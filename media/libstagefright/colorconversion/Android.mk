LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:=                     \
        ColorConverter.cpp            \
        SoftwareRenderer.cpp

LOCAL_C_INCLUDES := \
        $(TOP)/frameworks/native/include/media/openmax \
        $(TOP)/hardware/msm7k \
        $(TOP)/external/libyuv/files/include

LOCAL_SHARED_LIBRARIES := \
        libui \

LOCAL_STATIC_LIBRARIES := \
        libyuv_static \

ifeq ($(strip $(BOARD_USES_MTK_HARDWARE)),true)
LOCAL_C_INCLUDES += \
        $(TOP)/frameworks/av/media/libstagefright/colorconversion/inc

LOCAL_SHARED_LIBRARIES := \
	libdpframework
endif

LOCAL_CFLAGS += -Werror
LOCAL_SANITIZE := signed-integer-overflow cfi
LOCAL_SANITIZE_DIAG := cfi

LOCAL_MODULE:= libstagefright_color_conversion

include $(BUILD_STATIC_LIBRARY)
