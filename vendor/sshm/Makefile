SHELL := /bin/bash

# Package details
export VENDOR ?= claranet
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export PACKAGE_NAME ?= sshm
export PACKAGE_REPO_NAME ?= sshm

# https://github.com/claranet/sshm/releases/download/1.2.2/sshm_1.2.2_Linux_x86_64.tar.gz
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_$(DL_OS)_$(DL_ARCH).tar.gz
export CHECK_COMMAND_ARGUMENTS ?= --version
export CHECK_COMMAND_ENV ?= HOME=./

# arm64 not supported
export PACKAGE_ARCHS_DISABLED = arm64

include ../../tasks/Makefile.vendor_includes

ifeq ($(OS),darwin)
  export DL_OS = Darwin
else ifeq ($(OS),linux)
  export DL_OS = Linux
endif

ifeq ($(ARCH),amd64)
  export DL_ARCH = x86_64
endif

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --help 2>&1 | grep -q Usage
