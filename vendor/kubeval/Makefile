## Package - kubeval
include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk
include ../../tasks/Makefile.deb

export VENDOR = instrumenta
export PACKAGE_NAME = kubeval
export PACKAGE_REPO_NAME = kubeval
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_NAME)-$(OS)-$(ARCH).tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

## Uncomment only if you need additional libraries
#export APKBUILD_DEPENDS += libc6-compat musl

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --version

## This may be required for apk building and varies from package to package
# Custom post-package processing (Note the double colon to append to current inherited package/prepare task)
#package/prepare::
#	mv src/kubeval-$(OS).$(ARCH)/kubeval src
