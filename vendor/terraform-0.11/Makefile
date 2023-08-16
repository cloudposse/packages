# Package details
export VENDOR ?= hashicorp
export PACKAGE_REPO_NAME = terraform
export PACKAGE_EXE = terraform
export MASTER_PACKAGE_NAME = terraform
export MAJOR_VERSION = 0.11
export PACKAGE_NAME = $(MASTER_PACKAGE_NAME)-$(MAJOR_VERSION)

include ../../tasks/Makefile.vendor_includes

# NOTE: This build uses a custom build template ./APKBUILD
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export DOWNLOAD_URL ?= https://releases.hashicorp.com/terraform/$(PACKAGE_VERSION)/terraform_$(PACKAGE_VERSION)_$(OS)_$(ARCH).zip
export APKBUILD_DEPENDS += dpkg
export APKBUILD_INSTALL_SCRIPTS = $(PACKAGE_NAME).post-install $(PACKAGE_NAME).post-deinstall
export INSTALL_DIR = /usr/share/${MASTER_PACKAGE_NAME}/${MAJOR_VERSION}/bin

# terraform 0.11 is past end-of-life and no updates should be attempted.
export AUTO_UPDATE_ENABLED = false

install:
	mkdir -p $(TMP)/$(PACKAGE_NAME)
	$(CURL) -o $(TMP)/$(PACKAGE_NAME)/$(PACKAGE_NAME).zip $(DOWNLOAD_URL)
	unzip -d $(TMP)/$(PACKAGE_NAME) $(TMP)/$(PACKAGE_NAME)/$(PACKAGE_NAME).zip
	mv $(TMP)/$(PACKAGE_NAME)/terraform $(INSTALL_PATH)/$(PACKAGE_EXE)
	chmod +x $(INSTALL_PATH)/$(PACKAGE_EXE)

test:
	pinned-package-sanity-check "$(PACKAGE_VERSION)" "$(MAJOR_VERSION)"
	$(PACKAGE_EXE) version | grep -F $(PACKAGE_VERSION)
