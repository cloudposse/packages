export MASTER_PACKAGE_NAME = helm
export MAJOR_VERSION = 2
export PACKAGE_NAME = $(MASTER_PACKAGE_NAME)$(MAJOR_VERSION)
export PACKAGE_REPO_NAME = helm
export DOWNLOAD_URL ?= https://get.helm.sh/helm-v$(PACKAGE_VERSION)-$(OS)-$(ARCH).tar.gz

include ../../tasks/Makefile.vendor_includes

# Package details
export VENDOR ?= helm
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += dpkg
export APKBUILD_INSTALL_SCRIPTS = $(PACKAGE_NAME).post-install $(PACKAGE_NAME).post-deinstall
export INSTALL_DIR = /usr/share/${MASTER_PACKAGE_NAME}/${MAJOR_VERSION}/bin

install:
	mkdir -p $(TMP)/$(PACKAGE_NAME)
	$(CURL) -o - $(DOWNLOAD_URL) | tar -C $(TMP)/$(PACKAGE_NAME) -zx $(OS)-$(ARCH)/helm
	mv $(TMP)/$(PACKAGE_NAME)/$(OS)-$(ARCH)/helm $(INSTALL_PATH)/$(PACKAGE_NAME)
	rm -rf $(TMP)/$(PACKAGE_NAME)
	chmod +x $(INSTALL_PATH)/$(PACKAGE_NAME)

test:
	pinned-package-sanity-check "$(PACKAGE_VERSION)" "$(MAJOR_VERSION)"
	$(PACKAGE_NAME) version --client  | grep v$(PACKAGE_VERSION)

package/prepare::
	mv src/$(OS)-$(ARCH)/helm src/helm2
