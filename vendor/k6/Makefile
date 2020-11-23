include ../../tasks/Makefile.vendor_includes


ifeq ($(OS), darwin)
  OS=mac
  EXT=zip
else
  OS=linux64
  EXT=tar.gz
endif

# Package details
export VENDOR ?= loadimpact
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)-v$(PACKAGE_VERSION)-$(OS).$(EXT)
export APK_BUILD_TEMPLATE ?= AP KBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat

install-mac:
	$(CURL) -o - $(DOWNLOAD_URL) > $(INSTALL_PATH)/$(PACKAGE_NAME).zip
	unzip -p $(INSTALL_PATH)/$(PACKAGE_NAME).zip */$(PACKAGE_NAME) > $(INSTALL_PATH)/$(PACKAGE_NAME)
	rm $(INSTALL_PATH)/$(PACKAGE_NAME).zip
	chmod +x $(INSTALL_PATH)/$(PACKAGE_NAME)

install-linux64:
	$(CURL) -o - $(DOWNLOAD_URL) | tar --wildcards -zxO */$(PACKAGE_NAME) > $(INSTALL_PATH)/$(PACKAGE_NAME)
	chmod +x $(INSTALL_PATH)/$(PACKAGE_NAME)

install: install-$(OS)
	@exit 0

test:
	$(PACKAGE_EXE) version

package/prepare::
	mv src/$(PACKAGE_NAME)-v$(PACKAGE_VERSION)-$(OS)/$(PACKAGE_NAME) src/$(PACKAGE_NAME)
