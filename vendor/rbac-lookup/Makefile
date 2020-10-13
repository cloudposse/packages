
export VENDOR ?= reactiveops
export PACKAGE_REPO_NAME ?= rbac-lookup
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk
include ../../tasks/Makefile.deb


ifeq ($(OS), darwin)
  OS=Darwin
else ifeq ($(OS), linux)
  OS=Linux
endif

ifeq ($(ARCH), amd64)
  ARCH=x86_64
else ifeq ($(ARCH), 386)
  ARCH=i386
endif

export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/rbac-lookup_$(PACKAGE_VERSION)_$(OS)_$(ARCH).tar.gz

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) version
