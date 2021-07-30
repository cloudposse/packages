SHELL := /bin/bash

# Package details
export VENDOR ?= minamijoyo
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export PACKAGE_NAME ?= tfschema
# https://github.com/minamijoyo/tfschema/releases/download/v0.7.0/tfschema_0.7.0_linux_amd64.tar.gz
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_$(OS)_$(ARCH).tar.gz

include ../../tasks/Makefile.vendor_includes

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --version | grep -F $(PACKAGE_VERSION)
