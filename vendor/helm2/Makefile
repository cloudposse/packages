export MASTER_PACKAGE_NAME = helm
export MAJOR_VERSION = 2
export PACKAGE_NAME = $(MASTER_PACKAGE_NAME)$(MAJOR_VERSION)
export PACKAGE_REPO_NAME = helm
export DOWNLOAD_URL ?= https://get.helm.sh/helm-v$(PACKAGE_VERSION)-$(OS)-$(ARCH).tar.gz

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
export VENDOR ?= helm
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export AUTO_UPDATE_ENABLED = false

install:
	mkdir -p $(TMP)/$(PACKAGE_NAME)
	$(CURL) -o - $(DOWNLOAD_URL) | tar -C $(TMP)/$(PACKAGE_NAME) -zx $(OS)-$(ARCH)/helm
	mv $(TMP)/$(PACKAGE_NAME)/$(OS)-$(ARCH)/helm $(INSTALL_PATH)/$(PACKAGE_NAME)
	rm -rf $(TMP)/$(PACKAGE_NAME)
	chmod +x $(INSTALL_PATH)/helm

test:
	($(PACKAGE_EXE) || true) 2>&1 | grep version

package/prepare::
	mv src/$(OS)-$(ARCH)/helm src
