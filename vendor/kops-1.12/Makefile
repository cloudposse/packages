export MASTER_PACKAGE_NAME = kops
export MAJOR_VERSION = 1.12
export PACKAGE_NAME = $(MASTER_PACKAGE_NAME)-$(MAJOR_VERSION)
export PACKAGE_REPO_NAME = kops
export DOWNLOAD_URL = https://github.com/kubernetes/kops/releases/download/$(PACKAGE_VERSION)/kops-$(OS)-$(ARCH)
export PACKAGE_VERSION_PIN = $(MAJOR_VERSION).x
export AUTO_UPDATE_ENABLED = false

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk
include ../../tasks/Makefile.deb

# Package details
#
export VENDOR = kubernetes
export APK_BUILD_TEMPLATE = APKBUILD.github-binary
export APKBUILD_DEPENDS += dpkg
export APKBUILD_INSTALL_SCRIPTS = $(PACKAGE_NAME).post-install $(PACKAGE_NAME).post-deinstall
export INSTALL_DIR = /usr/share/${MASTER_PACKAGE_NAME}/${MAJOR_VERSION}/bin
export PACKAGE_EXE = kops

install:
	$(call download_binary)

test:
	pinned-package-sanity-check "$(PACKAGE_VERSION)" "$(MAJOR_VERSION)"
	$(PACKAGE_EXE) version | grep $(PACKAGE_VERSION)
