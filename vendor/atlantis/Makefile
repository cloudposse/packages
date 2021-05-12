# Package details
export VENDOR ?= runatlantis
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(OS)_$(ARCH).zip
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += dpkg libc6-compat
export APKBUILD_INSTALL_SCRIPTS = $(PACKAGE_NAME).post-install $(PACKAGE_NAME).post-deinstall
export MASTER_PACKAGE_NAME = atlantis
export INSTALL_DIR = /usr/share/${MASTER_PACKAGE_NAME}/${VENDOR}/bin

include ../../tasks/Makefile.vendor_includes

install:
	$(call download_zip)

test:
	@echo testing atlantis
	atlantis
	@echo checking atlantis version against $(PACKAGE_VERSION)
	$(PACKAGE_EXE) version
	$(PACKAGE_EXE) version | grep -F $(PACKAGE_VERSION)

