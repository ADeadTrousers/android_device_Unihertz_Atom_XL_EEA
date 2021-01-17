LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

INTERCOM_LIBS := libwebrtc_aecm.so libwebrtc_agc.so libwebrtc_ns.so libwebrtc_vad.so
INTERCOM_SYMLINKS := $(addprefix $(PRODUCT_OUT)/system/app/Intercom/lib/arm64/,$(notdir $(INTERCOM_LIBS)))
$(INTERCOM_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Intercom lib link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/lib64/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(INTERCOM_SYMLINKS)
