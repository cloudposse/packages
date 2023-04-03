# Package details
export VENDOR ?= wallix
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)-$(OS)-$(ARCH).tar.gz

# arm64 not supported
export PACKAGE_ARCHS_DISABLED = arm64

include ../../tasks/Makefile.vendor_includes

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --version
