SHELL := /bin/bash

# Package details
export VENDOR ?= infracost
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export PACKAGE_NAME ?= infracost
export PACKAGE_REPO_NAME ?= infracost
# https://github.com/infracost/infracost/releases/download/v0.9.24/infracost-linux-amd64.tar.gz
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)-$(OS)-$(ARCH).tar.gz
export CHECK_COMMAND_ARGUMENTS ?= --version
export CHECK_COMMAND_ENV ?= HOME=./

include ../../tasks/Makefile.vendor_includes

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --version | grep -F $(PACKAGE_VERSION)

# The tarball contains an executable named $(PACKAGE_NAME)-$(OS)-$(ARCH)
# but apk builder expects the tarball to contain an executable named $(PACKAGE_NAME)
package/prepare::
	mv $${APK_TMP_DIR}/src/$(PACKAGE_NAME)-$(OS)-$(ARCH) $${APK_TMP_DIR}/src/$(PACKAGE_NAME)
