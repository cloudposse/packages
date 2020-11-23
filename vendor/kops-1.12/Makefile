export MASTER_PACKAGE_NAME = kops
export MAJOR_VERSION = 1.12
export PACKAGE_NAME = $(MASTER_PACKAGE_NAME)-$(MAJOR_VERSION)
export PACKAGE_REPO_NAME = kops
export DOWNLOAD_URL = https://github.com/kubernetes/kops/releases/download/$(PACKAGE_VERSION)/kops-$(OS)-$(ARCH)
# This package is obsolete, so no further updates should be attempted
export PACKAGE_ENABLED = false
export AUTO_UPDATE_ENABLED = false

include ../../tasks/Makefile.vendor_includes

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
	$(PACKAGE_EXE) version | grep -F $(PACKAGE_VERSION)
