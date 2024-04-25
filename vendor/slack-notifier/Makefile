
# Package details
export VENDOR ?= cloudposse
export PACKAGE_EXE := slack-notifier
install: export PACKAGE_NAME = slack-notifier_v$(PACKAGE_VERSION)
# PACKAGE_URL
# https://github.com/cloudposse/slack-notifier/releases/download/0.9.0/slack-notifier_0.9.0_linux_arm64.zip
export DOWNLOAD_URL = https://github.com/cloudposse/slack-notifier/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_EXE)_$(PACKAGE_VERSION)_$(OS)_$(ARCH).zip
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat

include ../../tasks/Makefile.vendor_includes

install:
	echo $(DOWNLOAD_URL)
	$(call download_zip)

test:
	($(PACKAGE_EXE) || true) 2>&1 | grep author_icon
