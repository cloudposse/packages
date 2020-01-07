
include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

ifeq ($(ARCH), amd64)
	ARCH=x86_64
endif

ifeq ($(OS), darwin)
  OS=Darwin
else
  OS=Linux
endif

export VENDOR = derailed
export PACKAGE_NAME = popeye
export PACKAGE_REPO_NAME = popeye
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_$(OS)_$(ARCH).tar.gz

## APK build specific requirements
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

CURRENT_VERSION: QUERY=first(.[] | .name)
CURRENT_VERSION: API=releases


install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) version
