include ../../tasks/Makefile.vendor_includes

# Package details
export VENDOR ?= cloudposse
# PACKAGE_VERSION
# https://github.com/cloudposse/slack-notifier/releases/download/0.5.1/slack-notifier_0.5.1_linux_arm64
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_$(OS)_$(ARCH)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat

install:
	echo $(DOWNLOAD_URL)
	$(call download_binary)

test:
	($(PACKAGE_EXE) || true) 2>&1 | grep author_icon
