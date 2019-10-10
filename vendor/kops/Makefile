include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
# This package tracks the most advanced production-ready version of kops
export VENDOR ?= kubernetes
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_NAME)-$(OS)-$(ARCH)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += dpkg
export APKBUILD_INSTALL_SCRIPTS = $(PACKAGE_NAME).post-install $(PACKAGE_NAME).post-deinstall
export MAJOR_VERSION = latest
export INSTALL_DIR = /usr/share/${PACKAGE_NAME}/${MAJOR_VERSION}/bin

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) version
