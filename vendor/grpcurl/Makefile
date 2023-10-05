export VENDOR ?= fullstorydev
export PACKAGE_REPO_NAME ?= grpcurl
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/grpcurl_$(PACKAGE_VERSION)_$(OS)_$(ARCH).tar.gz
export APKBUILD_DEPENDS = gcompat libc6-compat

include ../../tasks/Makefile.vendor_includes

ifeq ($(ARCH), amd64)
	ARCH=x86_64
endif

ifeq ($(OS), darwin)
  OS=osx
else
  OS=linux
endif

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) -version
