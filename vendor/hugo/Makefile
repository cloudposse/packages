include ../../tasks/Makefile.vendor_includes

ifeq ($(OS), darwin)
  DL_ARCH=universal
else
  DL_ARCH=$(ARCH)
endif

# Package details
export VENDOR ?= gohugoio
# https://github.com/gohugoio/hugo/releases/download/v0.111.3/hugo_0.111.3_linux-amd64.tar.gz
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_$(OS)-$(DL_ARCH).tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) version
