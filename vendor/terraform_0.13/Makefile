# Package details
export VENDOR ?= hashicorp
export APK_PACKAGE_NAME = terraform_0.13
export PACKAGE_REPO_NAME = terraform
export PACKAGE_VERSION_PIN = 0.13.x

export PACKAGE_TYPES_DISABLED = deb rpm

include ../../tasks/Makefile.vendor_includes

export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export DOWNLOAD_URL ?= https://releases.hashicorp.com/terraform/$(PACKAGE_VERSION)/terraform_$(PACKAGE_VERSION)_$(OS)_$(ARCH).zip

# terraform 0.13 is past end-of-life and no updates should be attempted.
export AUTO_UPDATE_ENABLED = false

install:
	mkdir -p $(TMP)/$(PACKAGE_NAME)
	$(CURL) -o $(TMP)/$(PACKAGE_NAME)/$(PACKAGE_NAME).zip $(DOWNLOAD_URL)
	unzip -d $(TMP)/$(PACKAGE_NAME) $(TMP)/$(PACKAGE_NAME)/$(PACKAGE_NAME).zip
	mv $(TMP)/$(PACKAGE_NAME)/terraform $(INSTALL_PATH)/$(PACKAGE_EXE)
	chmod +x $(INSTALL_PATH)/$(PACKAGE_EXE)

test:
	$(PACKAGE_EXE) version
