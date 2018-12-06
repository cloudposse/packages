include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

ifeq ($(OS), darwin)
	EXTENSION=zip
else
  EXTENSION=tar.gz
endif

# Package details
export VENDOR ?= tcnksm
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_v$(PACKAGE_VERSION)_$(OS)_$(ARCH).$(EXTENSION)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install: install-$(OS)
	@exit 0

install-darwin:
	$(CURL) -o - $(DOWNLOAD_URL) > $(INSTALL_PATH)/ghr.zip
	unzip -p $(INSTALL_PATH)/ghr.zip */ghr > $(INSTALL_PATH)/ghr
	rm $(INSTALL_PATH)/ghr.zip
	chmod +x $(INSTALL_PATH)/ghr

install-linux:
	$(CURL) -o - $(DOWNLOAD_URL) | tar --wildcards -zxO */ghr > $(INSTALL_PATH)/ghr
	chmod +x $(INSTALL_PATH)/ghr

test:
	$(PACKAGE_EXE) --version

package/prepare::
	mv src/ghr_v$(PACKAGE_VERSION)_$(OS)_$(ARCH)/$(PACKAGE_EXE) src
