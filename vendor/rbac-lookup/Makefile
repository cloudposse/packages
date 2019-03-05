
ifeq ($(OS), darwin)
  OS=Darwin
else
  OS=Linux
endif

ifeq ($(ARCH), amd64)
  ARCH=x86_64
else
  ARCH=i386
endif


export VENDOR ?= reactiveops
export PACKAGE_REPO_NAME ?= rbac-lookup
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/rbac-lookup_$(PACKAGE_VERSION)_$(OS)_$(ARCH).tar.gz

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) version
