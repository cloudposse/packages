include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk


ifeq ($(OS), darwin)
  OS=mac
  EXT=zip
else
  OS=linux64
  EXT=tar.gz
endif

# Package details
export VENDOR ?= loadimpact
export DOWNLOAD_URL ?= $(REPO_URL)/releases/download/v$(VERSION)/$(PACKAGE_NAME)-v$(VERSION)-$(OS).$(EXT)
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
	$(EXE) version

package/prepare::
	mv src/$(PACKAGE_NAME)-v$(VERSION)-$(OS)/$(PACKAGE_NAME) src/$(PACKAGE_NAME)
