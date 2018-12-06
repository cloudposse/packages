include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
export VENDOR ?= ahmetb
export DOWNLOAD_URL ?= https://raw.githubusercontent.com/ahmetb/$(PACKAGE_NAME)/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += bash

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) -h
