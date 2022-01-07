SHELL := /bin/bash

# Package details
export VENDOR ?= aquasecurity
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export PACKAGE_NAME ?= tfsec
export PACKAGE_REPO_NAME ?= tfsec
# https://github.com/aquasecurity/tfsec/releases/download/v0.63.1/tfsec-linux-amd64
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)-$(OS)-$(ARCH)
export CHECK_COMMAND_ARGUMENTS ?= --version
export CHECK_COMMAND_ENV ?= HOME=./

include ../../tasks/Makefile.vendor_includes

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) --version | grep -F $(PACKAGE_VERSION)
