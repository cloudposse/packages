SHELL := /bin/bash

# Package details
export VENDOR ?= claranet
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export PACKAGE_NAME ?= sshm
export PACKAGE_REPO_NAME ?= sshm
# upper cases the first letter of the OS
export PACKAGE_OS ?= $(shell echo "$(OS)" | cut -c1 | tr '[:lower:]' '[:upper:]')$(shell echo "$(OS)" | cut -c2-)
export PACKAGE_ARCH_amd64 ?= x86_64
export PACKAGE_ARCH ?= ${PACKAGE_ARCH_${ARCH}}
# https://github.com/claranet/sshm/releases/download/1.2.2/sshm_1.2.2_Linux_x86_64.tar.gz
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_$(PACKAGE_OS)_$(PACKAGE_ARCH).tar.gz
export CHECK_COMMAND_ARGUMENTS ?= --version
export CHECK_COMMAND_ENV ?= HOME=./

include ../../tasks/Makefile.vendor_includes

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --help 2>&1 | grep -q Usage
