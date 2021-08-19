SHELL := /bin/bash

include ../../tasks/Makefile.vendor_includes

ifeq ($(OS), darwin)
	FILENAME_PATH=mac/sessionmanager-bundle.zip
else
	FILENAME_PATH=linux_64bit/session-manager-plugin.rpm
endif

# Package details
export VENDOR ?= amazon
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export PACKAGE_NAME ?= session-manager-plugin
# Download zip for mac
# https://session-manager-downloads.s3.amazonaws.com/plugin/1.2.234.0/mac/sessionmanager-bundle.zip
# https://session-manager-downloads.s3.amazonaws.com/plugin/1.2.234.0/linux_64bit/session-manager-plugin.rpm
export DOWNLOAD_URL ?= https://session-manager-downloads.s3.amazonaws.com/plugin/$(PACKAGE_VERSION)/$(FILENAME_PATH)

install: install-$(OS)
	@exit 0

install-darwin:
	$(call download_zip)

install-linux:
	$(call download_rpm)

test:
	$(PACKAGE_EXE) --version | grep -F $(PACKAGE_VERSION)
