include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
export VENDOR ?= hashicorp
export DOWNLOAD_URL ?= https://releases.hashicorp.com/$(PACKAGE_NAME)/$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_$(OS)_$(ARCH).zip
	## Run go generate in all packages
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	mkdir -p $(TMP)/$(PACKAGE_NAME)
	$(CURL) -o $(TMP)/$(PACKAGE_NAME)/terraform.zip $(DOWNLOAD_URL)
	unzip -d $(TMP)/$(PACKAGE_NAME) $(TMP)/$(PACKAGE_NAME)/$(PACKAGE_NAME).zip
	mv $(TMP)/$(PACKAGE_NAME)/$(PACKAGE_NAME) $(INSTALL_PATH)/$(PACKAGE_NAME)
	chmod +x $(INSTALL_PATH)/$(PACKAGE_NAME)

test:
	$(PACKAGE_EXE) version

