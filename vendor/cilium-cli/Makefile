
# Package details
export VENDOR := cilium
export PACKAGE_EXE := cilium
export PACKAGE_HOMEPAGE_URL := https://cilium.io/
# https://github.com/cilium/cilium-cli/releases/download/v0.16.7/cilium-linux-amd64.tar.gz
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_EXE)-$(OS)-$(ARCH).tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

include ../../tasks/Makefile.vendor_includes

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) version --client && $(PACKAGE_EXE) version --client | grep -q -F $(PACKAGE_VERSION)
