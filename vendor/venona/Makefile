# Package details
export VENDOR ?= codefresh-io
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_$(OS)_$(ARCH).tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

PACKAGE_ARCHS_DISABLED = arm64

include ../../tasks/Makefile.vendor_includes

ifeq ($(ARCH), amd64)
	ARCH=x86_64
endif

ifeq ($(OS), darwin)
  OS=Darwin
else
  OS=Linux
endif


install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) version
