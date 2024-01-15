
include ../../tasks/Makefile.vendor_includes

ifeq ($(OS), darwin)
  OS=Darwin
else
  OS=Linux
endif

export VENDOR = derailed
export PACKAGE_NAME = popeye
export PACKAGE_REPO_NAME = popeye
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(OS)_$(ARCH).tar.gz

## APK build specific requirements
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) version
