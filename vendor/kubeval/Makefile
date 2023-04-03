## Package - kubeval

export VENDOR = instrumenta
export PACKAGE_NAME = kubeval
export PACKAGE_REPO_NAME = kubeval
# https://github.com/instrumenta/kubeval/releases/download/v0.16.1/kubeval-linux-amd64.tar.gz
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)-$(OS)-$(ARCH).tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

# arm64 not supported
export PACKAGE_ARCHS_DISABLED = arm64

include ../../tasks/Makefile.vendor_includes


install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --version

