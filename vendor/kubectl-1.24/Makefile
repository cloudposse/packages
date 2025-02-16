export MASTER_PACKAGE_NAME = kubectl
export MAJOR_VERSION = 1.24
export PACKAGE_NAME = $(MASTER_PACKAGE_NAME)-$(MAJOR_VERSION)
export PACKAGE_REPO_NAME = kubernetes
export INSTALL_DIR = /usr/share/${MASTER_PACKAGE_NAME}/${MAJOR_VERSION}/bin

# This version is technically past end-of-life, so we allow updates to fail,
# which can happen because the latest version is not among the latest 100 releases,
# but we keep checking anyway in case there is a security patch.
# See https://kubernetes.io/releases/patch-releases/#non-active-branch-history
# and https://endoflife.date/amazon-eks
export AUTO_UPDATE_ENABLED = softfail

include ../../tasks/Makefile.vendor_includes

# Package details
export VENDOR = kubernetes
export DOWNLOAD_URL = https://storage.googleapis.com/kubernetes-release/release/v$(PACKAGE_VERSION)/bin/$(OS)/$(ARCH)/kubectl
export APK_BUILD_TEMPLATE = APKBUILD.github-binary
export APKBUILD_DEPENDS += dpkg
export APKBUILD_INSTALL_SCRIPTS = $(PACKAGE_NAME).post-install $(PACKAGE_NAME).post-deinstall

install:
	$(call download_binary)

test:
	pinned-package-sanity-check "$(PACKAGE_VERSION)" "$(MAJOR_VERSION)"
	$(PACKAGE_EXE) version --client | grep -F $(PACKAGE_VERSION)
