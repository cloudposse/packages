include ../../tasks/Makefile.vendor_includes

ifeq ($(OS), darwin)
  OS=Darwin
else
  OS=Linux
endif

ifeq ($(ARCH), amd64)
  ARCH=x86_64
endif

## Package details
export VENDOR = jesseduffield
export PACKAGE_NAME = lazydocker
export PACKAGE_REPO_NAME = lazydocker
GITHUB_VERSION = $(shell echo $(PACKAGE_VERSION) | sed -E 's/\.0$$//')
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(GITHUB_VERSION)/$(PACKAGE_NAME)_$(GITHUB_VERSION)_$(OS)_$(ARCH).tar.gz

## APK build specific requirements
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --version
