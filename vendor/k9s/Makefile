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
export PACKAGE_NAME = k9s
export PACKAGE_REPO_NAME = k9s
export DOWNLOAD_URL = $(PACKAGE_REPO_URL)/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_$(OS)_$(ARCH).tar.gz

## APK build specific requirements
export APK_BUILD_TEMPLATE = APKBUILD.github-binary

CURRENT_VERSION: QUERY=first(.[] | .name)
CURRENT_VERSION: API=releases

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) version

## This may be required for apk building and varies from package to package
## Custom post-package processing (Note the double colon to append to current inherited package/prepare task)
#package/prepare::
#	mv src/k9s-$(OS).$(ARCH)/k9s src
