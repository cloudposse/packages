export MASTER_PACKAGE_NAME = kubectl
export MAJOR_VERSION = 1.14
export PACKAGE_NAME = $(MASTER_PACKAGE_NAME)-$(MAJOR_VERSION)
export PACKAGE_REPO_NAME = kubernetes

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
export VENDOR = kubernetes
export DOWNLOAD_URL = https://storage.googleapis.com/kubernetes-release/release/v$(PACKAGE_VERSION)/bin/$(OS)/$(ARCH)/kubectl
export APK_BUILD_TEMPLATE = APKBUILD.github-binary
export APKBUILD_DEPENDS += dpkg
export APKBUILD_INSTALL_SCRIPTS = $(PACKAGE_NAME).post-install $(PACKAGE_NAME).post-deinstall
export INSTALL_DIR = /usr/share/${MASTER_PACKAGE_NAME}/${MAJOR_VERSION}/bin
export AUTO_UPDATE_ENABLED = false

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) --help
