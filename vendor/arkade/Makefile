## Package - arkade
include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

export VENDOR = alexellis
export PACKAGE_NAME = arkade
export PACKAGE_REPO_NAME = arkade
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_NAME)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

## Uncomment only if you need additional libraries
#export APKBUILD_DEPENDS += libc6-compat musl

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) --version

## This may be required for apk building and varies from package to package
# Custom post-package processing (Note the double colon to append to current inherited package/prepare task)
#package/prepare::
#	mv src/arkade-$(OS).$(ARCH)/arkade src
