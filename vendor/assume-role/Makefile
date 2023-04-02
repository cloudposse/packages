include ../../tasks/Makefile.vendor_includes

OS=$(shell uname -s)

# arm64 not supported
export PACKAGE_ARCHS_DISABLED = arm64

# Package details

export VENDOR ?= remind101
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_NAME)-$(OS)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) 2>&1 |grep -q Usage
