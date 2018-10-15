include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
export VENDOR ?= aktau
export DOWNLOAD_URL ?= $(REPO_URL)/releases/download/v$(VERSION)/$(OS)-$(ARCH)-$(NAME).tar.bz2
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	mkdir -p $(TMP)/$(NAME)
	$(CURL) -o - https://github.com/aktau/$(NAME)/releases/download/v$(VERSION)/$(OS)-$(ARCH)-$(NAME).tar.bz2 | tar -C $(TMP)/$(NAME) -zx bin/$(OS)/$(ARCH)/$(NAME)
	mv $(TMP)/$(NAME)/bin/$(OS)/$(ARCH)/$(NAME) $(INSTALL_PATH)/$(NAME)
	rm -rf $(TMP)/$(NAME)
	chmod +x $(INSTALL_PATH)/$(NAME)

test:
	$(EXE) --version

package/prepare::
	mv src/bin/$(OS)/$(ARCH)/$(EXE) src