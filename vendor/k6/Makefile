include ../../tasks/Makefile.vendor_includes


ifeq ($(OS), darwin)
  OS=macos
  EXT=zip
else
  EXT=tar.gz
endif

# Package details
export VENDOR ?= k6io
# https://github.com/k6io/k6/releases/download/v0.32.0/k6-v0.32.0-linux-amd64.tar.gz
# https://github.com/k6io/k6/releases/download/v0.32.0/k6-v0.32.0-macos-arm64.zip
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)-v$(PACKAGE_VERSION)-$(OS)-$(ARCH).$(EXT)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat

install-macos:
	$(call download_zip)

install-linux:
	$(call download_tar_gz)

install: install-$(OS)
	@exit 0

test:
	$(PACKAGE_EXE) version

package/prepare::
	mv src/$(PACKAGE_NAME)-v$(PACKAGE_VERSION)-$(OS)-$(ARCH)/$(PACKAGE_NAME) src/$(PACKAGE_NAME)
