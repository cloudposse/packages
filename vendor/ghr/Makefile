include ../../tasks/Makefile.vendor_includes

ifeq ($(OS), darwin)
	EXTENSION=zip
else
	EXTENSION=tar.gz
endif

# Package details
export VENDOR ?= tcnksm
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_v$(PACKAGE_VERSION)_$(OS)_$(ARCH).$(EXTENSION)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

# gcompat is required for glibc compatibility, alternative to libc6-compat + musl
export APKBUILD_DEPENDS += gcompat

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
	echo '* Verify the package can be executed and has the right version'
	$(PACKAGE_EXE) --version | grep -F $(PACKAGE_VERSION)

package/prepare::
	mv src/ghr_v$(PACKAGE_VERSION)_$(OS)_$(ARCH)/$(PACKAGE_EXE) src
