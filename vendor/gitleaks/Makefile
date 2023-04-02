
include ../../tasks/Makefile.vendor_includes

ifeq ($(ARCH), amd64)
  DL_ARCH=x64
else
  DL_ARCH=$(ARCH)
endif

# Package details
export VENDOR ?= zricethezav
# https://github.com/zricethezav/gitleaks/releases/download/v8.0.2/gitleaks_8.0.2_darwin_x64.tar.gz
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_$(OS)_$(DL_ARCH).tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(call download_tar_gz)

test:
	$(PACKAGE_EXE) version | grep -F $(PACKAGE_VERSION)
