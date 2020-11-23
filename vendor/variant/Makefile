export MASTER_PACKAGE_NAME = variant
export ALTERNATIVE_TAG = 1
# In this case, we want to keep the package named variant, not variant1
export PACKAGE_NAME = $(MASTER_PACKAGE_NAME)

export VENDOR ?= mumoshu
export PACKAGE_REPO_NAME ?= variant
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/variant_$(PACKAGE_VERSION)_$(OS)_$(ARCH).tar.gz
export APKBUILD_DEPENDS += dpkg
export APKBUILD_INSTALL_SCRIPTS = $(PACKAGE_NAME).post-install $(PACKAGE_NAME).post-deinstall
export INSTALL_DIR = /usr/share/${MASTER_PACKAGE_NAME}/${ALTERNATIVE_TAG}/bin

export PACKAGE_EXE = variant
export PACKAGE_DESCRIPTION = Variant is a Universal CLI tool that works like a task runner

include ../../tasks/Makefile.vendor_includes

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) version 2>&1 | grep -q $(PACKAGE_VERSION)

