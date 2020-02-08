## Package - gonsul
include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

export VENDOR = miniclip
export PACKAGE_NAME = gonsul
export PACKAGE_REPO_NAME = gonsul
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(OS)-$(PACKAGE_NAME).zip
export APK_BUILD_TEMPLATE ?= APKBUILD.github-zip

## Uncomment only if you need additional libraries
#export APKBUILD_DEPENDS += libc6-compat musl

install:
	$(call download_zip)

test:
	$(PACKAGE_EXE) -v

## This may be required for apk building and varies from package to package
# Custom post-package processing (Note the double colon to append to current inherited package/prepare task)
#package/prepare::
#	mv src/gonsul-$(OS).$(ARCH)/gonsul src
