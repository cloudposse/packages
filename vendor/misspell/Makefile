# arm64 not supported
export PACKAGE_ARCHS_DISABLED = arm64

# Package details
export VENDOR ?= client9
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_$(OS)_64bit.tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

include ../../tasks/Makefile.vendor_includes

ifeq ($(OS), darwin)
	OS=mac
endif


install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) -v
