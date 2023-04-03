SHELL := /bin/bash

# Package details
export VENDOR ?= EnvCLI
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export PACKAGE_NAME ?= envcli
export PACKAGE_REPO_NAME ?= EnvCLI
# https://github.com/EnvCLI/EnvCLI/releases/download/v0.7.1/linux_amd64
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(OS)_$(ARCH)
export CHECK_COMMAND_ARGUMENTS ?= --version
export CHECK_COMMAND_ENV ?= HOME=./

# arm64 not supported
export PACKAGE_ARCHS_DISABLED = arm64

include ../../tasks/Makefile.vendor_includes

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) --version | grep -F $(PACKAGE_VERSION)
