include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
export VENDOR ?= jpignata
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)-$(PACKAGE_VERSION)-$(OS)-$(ARCH).zip
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(CURL) -o - $(DOWNLOAD_URL) > $(TMP)/$(PACKAGE_NAME).zip
	unzip -p $(TMP)/$(PACKAGE_NAME).zip $(PACKAGE_NAME) > $(INSTALL_PATH)/$(PACKAGE_NAME)
	rm $(TMP)/$(PACKAGE_NAME).zip
	chmod +x $(INSTALL_PATH)/$(PACKAGE_NAME)

test:
	$(PACKAGE_EXE) --version

