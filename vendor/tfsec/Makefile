SHELL := /bin/bash

# Package details
export VENDOR ?= aquasecurity
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export PACKAGE_NAME ?= tfsec
export PACKAGE_REPO_NAME ?= tfsec

# Prior to v1.28.7 https://github.com/aquasecurity/tfsec/releases/download/v0.63.1/tfsec-linux-amd64
# v1.28.7 had no assets release
# v1.28.8 https://github.com/aquasecurity/tfsec/releases/download/v1.28.8/tfsec_1.28.8_linux_amd64.tar.gz
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_$(OS)_$(ARCH).tar.gz
export CHECK_COMMAND_ARGUMENTS ?= --version
export CHECK_COMMAND_ENV ?= HOME=./

include ../../tasks/Makefile.vendor_includes

install:
	$(call download_tar_gz)

test:
	$(PACKAGE_EXE) --version | grep -F $(PACKAGE_VERSION)
