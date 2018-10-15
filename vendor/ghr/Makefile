include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

ifeq ($(OS), darwin)
  $(eval EXTENSION := zip)
else
  $(eval EXTENSION := tar.gz)
endif

# Package details
export VENDOR ?= tcnksm
export DOWNLOAD_URL ?= $(REPO_URL)/releases/download/v$(VERSION)/$(NAME)_v$(VERSION)_$(OS)_$(ARCH).$(EXTENSION)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install: install-$(OS)
	@exit 0

install-darwin:
	$(CURL) -o - https://github.com/tcnksm/ghr/releases/download/v$(VERSION)/ghr_v$(VERSION)_darwin_$(ARCH).zip > $(INSTALL_PATH)/ghr.zip
	unzip -p $(INSTALL_PATH)/ghr.zip */ghr > $(INSTALL_PATH)/ghr
	rm $(INSTALL_PATH)/ghr.zip
	chmod +x $(INSTALL_PATH)/ghr

install-linux:
	$(CURL) -o - https://github.com/tcnksm/ghr/releases/download/v$(VERSION)/ghr_v$(VERSION)_linux_$(ARCH).tar.gz | tar --wildcards -zxO */ghr > $(INSTALL_PATH)/ghr
	chmod +x $(INSTALL_PATH)/ghr

test:
	$(EXE) --version

package/prepare::
	mv src/ghr_v$(VERSION)_$(OS)_$(ARCH)/$(EXE) src
