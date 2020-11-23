## Package - kubeval
include ../../tasks/Makefile.vendor_includes

export VENDOR = instrumenta
export PACKAGE_NAME = kubeval
export PACKAGE_REPO_NAME = kubeval
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_NAME)-$(OS)-$(ARCH).tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --version

