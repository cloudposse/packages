## Typical Github binary release

## Package details 
export VENDOR = jenkins-x
export PACKAGE_NAME = jx
export PACKAGE_REPO_NAME = jx
export DOWNLOAD_URL = $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/jx-$(OS)-$(ARCH).tar.gz

## APK build specific requirements
export APK_BUILD_TEMPLATE = APKBUILD.github-binary
## Uncomment only if you need additional libraries
#export APKBUILD_DEPENDS += libc6-compat musl

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --version

## This may be required for apk building and varies from package to package
## Custom post-package processing (Note the double colon to append to current inherited package/prepare task)
#package/prepare::
#	mv src/jx-$(OS).$(ARCH)/jx src
