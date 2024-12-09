include ../../tasks/Makefile.vendor_includes

export VENDOR = cloudflare
export PACKAGE_NAME = cfssl
export PACKAGE_REPO_NAME = cfssl
export DOWNLOAD_URL = $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_$(OS)_$(ARCH)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

# arm64 not supported on MacOS, but OK to install AMD64 version
ifeq ($(OS),darwin)
	ARCH = amd64
endif
# export PACKAGE_ARCHS_DISABLED = arm64

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) version
