include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk
include ../../tasks/Makefile.deb

# Package details
export VENDOR ?= runatlantis
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(OS)_$(ARCH).zip
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += dpkg
export APKBUILD_INSTALL_SCRIPTS = $(PACKAGE_NAME).post-install $(PACKAGE_NAME).post-deinstall
export MASTER_PACKAGE_NAME = atlantis
export INSTALL_DIR = /usr/share/${MASTER_PACKAGE_NAME}/${VENDOR}/bin

install:
	$(call download_zip)

test:
	$(PACKAGE_EXE) version | grep $(PACKAGE_VERSION)

