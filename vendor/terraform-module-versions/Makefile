# Package details
export VENDOR ?= keilerkonzept
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export PACKAGE_NAME ?= terraform-module-versions
export PACKAGE_REPO_NAME ?= terraform-module-versions
export PACKAGE_ARCH_amd64 ?= x86_64
export PACKAGE_ARCH_arm64 ?= arm64
export PACKAGE_ARCH ?= ${PACKAGE_ARCH_${ARCH}}

include ../../tasks/Makefile.vendor_includes

ifeq ($(OS), darwin)
  PACKAGE_OS=osx
else
  PACKAGE_OS=linux
endif

# https://github.com/keilerkonzept/terraform-module-versions/releases/download/3.1.6/terraform-module-versions_3.1.6_osx_x86_64.tar.gz
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_$(PACKAGE_OS)_$(PACKAGE_ARCH).tar.gz

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --help 2>&1 | grep -iq usage
