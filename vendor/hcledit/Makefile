SHELL := /bin/bash

# Package details
export VENDOR ?= minamijoyo
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export PACKAGE_NAME ?= hcledit
export PACKAGE_REPO_NAME ?= hcledit
# https://github.com/minamijoyo/hcledit/releases/download/v0.2.0/hcledit_0.2.0_linux_amd64.tar.gz
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_$(OS)_$(ARCH).tar.gz
export CHECK_COMMAND_ARGUMENTS ?= --version
export CHECK_COMMAND_ENV ?= HOME=./

include ../../tasks/Makefile.vendor_includes

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) version | grep -F $(PACKAGE_VERSION)
