# Package details
export VENDOR ?= hashicorp
export PACKAGE_REPO_NAME = terraform
export PACKAGE_EXE = terraform
export MASTER_PACKAGE_NAME = terraform
export MAJOR_VERSION = 0.15
export PACKAGE_PRERELEASE_ENABLED = true
export PACKAGE_NAME = $(MASTER_PACKAGE_NAME)-$(MAJOR_VERSION)

# This version is technically past end-of-life, so we allow updates to fail,
# but we keep checking anyway in case there is a security patch.
export AUTO_UPDATE_ENABLED = softfail

include ../../tasks/Makefile.vendor_includes

# NOTE: This build uses a custom build template ./APKBUILD
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export DOWNLOAD_URL ?= https://releases.hashicorp.com/terraform/$(PACKAGE_VERSION)/terraform_$(PACKAGE_VERSION)_$(OS)_$(ARCH).zip
export APKBUILD_DEPENDS += dpkg
export APKBUILD_INSTALL_SCRIPTS = $(PACKAGE_NAME).post-install $(PACKAGE_NAME).post-deinstall
export INSTALL_DIR = /usr/share/${MASTER_PACKAGE_NAME}/${MAJOR_VERSION}/bin

install:
	mkdir -p $(TMP)/$(PACKAGE_NAME)
	$(CURL) -o $(TMP)/$(PACKAGE_NAME)/$(PACKAGE_NAME).zip $(DOWNLOAD_URL)
	unzip -d $(TMP)/$(PACKAGE_NAME) $(TMP)/$(PACKAGE_NAME)/$(PACKAGE_NAME).zip
	mv $(TMP)/$(PACKAGE_NAME)/terraform $(INSTALL_PATH)/$(PACKAGE_EXE)
	chmod +x $(INSTALL_PATH)/$(PACKAGE_EXE)

test:
	$(PACKAGE_EXE) version | grep $(MAJOR_VERSION)
