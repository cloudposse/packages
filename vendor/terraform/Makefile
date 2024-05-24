# Do not publish BSL licensed software

export AUTO_UPDATE_ENABLED := false

export VENDOR ?= hashicorp
export PACKAGE_REPO_NAME = terraform
export MASTER_PACKAGE_NAME = terraform
export MAJOR_VERSION = latest

include ../../tasks/Makefile.vendor_includes

# Package details
export DOWNLOAD_URL ?= https://releases.hashicorp.com/terraform/$(PACKAGE_VERSION)/terraform_$(PACKAGE_VERSION)_$(OS)_$(ARCH).zip
export APKBUILD_DEPENDS += dpkg
export APKBUILD_INSTALL_SCRIPTS = $(PACKAGE_NAME).post-install $(PACKAGE_NAME).post-deinstall
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export INSTALL_DIR = /usr/share/${MASTER_PACKAGE_NAME}/${MAJOR_VERSION}/bin

install:
	mkdir -p $(TMP)/$(PACKAGE_NAME)
	$(CURL) -o $(TMP)/$(PACKAGE_NAME)/terraform.zip $(DOWNLOAD_URL)
	unzip -d $(TMP)/$(PACKAGE_NAME) $(TMP)/$(PACKAGE_NAME)/$(PACKAGE_NAME).zip
	mv $(TMP)/$(PACKAGE_NAME)/$(PACKAGE_NAME) $(INSTALL_PATH)/$(PACKAGE_NAME)
	chmod +x $(INSTALL_PATH)/$(PACKAGE_NAME)

test:
	$(PACKAGE_EXE) version | grep -F $(PACKAGE_VERSION)
