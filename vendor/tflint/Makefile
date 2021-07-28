SHELL := /bin/bash

# Package details
export VENDOR ?= terraform-linters
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export PACKAGE_NAME ?= tflint
export PACKAGE_REPO_NAME ?= tflint
# https://github.com/terraform-linters/tflint/releases/download/v0.30.0/tflint_linux_amd64.zip
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(OS)_$(ARCH).zip
export CHECK_COMMAND_ARGUMENTS ?= --version
export CHECK_COMMAND_ENV ?= HOME=./

include ../../tasks/Makefile.vendor_includes

install:
	$(call download_zip)

test:
	$(PACKAGE_EXE) --version | grep -F $(PACKAGE_VERSION)
