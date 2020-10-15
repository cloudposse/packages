export MASTER_PACKAGE_NAME = variant
export MAJOR_VERSION = 2
export PACKAGE_NAME = $(MASTER_PACKAGE_NAME)$(MAJOR_VERSION)

export VENDOR ?= mumoshu
export PACKAGE_REPO_NAME ?= variant2
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/variant_$(PACKAGE_VERSION)_$(OS)_$(ARCH).tar.gz
export APKBUILD_DEPENDS += dpkg
export APKBUILD_INSTALL_SCRIPTS = $(PACKAGE_NAME).post-install $(PACKAGE_NAME).post-deinstall
export INSTALL_DIR = /usr/share/${MASTER_PACKAGE_NAME}/${MAJOR_VERSION}/bin

export PACKAGE_EXE = variant
export PACKAGE_DESCRIPTION = Second major version of Variant, a Universal CLI tool that works like a task runner

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk
include ../../tasks/Makefile.deb

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) help | grep help
