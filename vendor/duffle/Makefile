## Typical Github binary release

## Package details 
export VENDOR = cnabio
export PACKAGE_NAME = duffle
export PACKAGE_REPO_NAME = duffle

# project is abandoned https://github.com/cnabio/duffle
export PACKAGE_ENABLED = false
export AUTO_UPDATE_ENABLED = false



export GITHUB_VERSION := $(shell cat VERSION)
export PACKAGE_VERSION := $(shell echo ${GITHUB_VERSION} | sed -E 's/\-beta\.([0-9]+)/b\1/')
export DOWNLOAD_URL = $(PACKAGE_REPO_URL)/releases/download/$(GITHUB_VERSION)/duffle-$(OS)-$(ARCH)

## APK build specific requirements
export APK_BUILD_TEMPLATE = APKBUILD.github-binary

include ../../tasks/Makefile.vendor_includes

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) version
