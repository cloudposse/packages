## Typical Github binary release

## Package details 
export VENDOR = cnabio
export PACKAGE_NAME = duffle
export PACKAGE_REPO_NAME = duffle
export DOWNLOAD_URL = $(PACKAGE_REPO_URL)/releases/download/$(PACKAGE_VERSION)-beta.1/duffle-$(OS)-$(ARCH)

## APK build specific requirements
export APK_BUILD_TEMPLATE = APKBUILD.github-binary
## Uncomment only if you need additional libraries
#export APKBUILD_DEPENDS += libc6-compat musl

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) version

## This may be required for apk building and varies from package to package
## Custom post-package processing (Note the double colon to append to current inherited package/prepare task)
#package/prepare::
#	mv src/duffle-$(OS)-$(ARCH)/duffle src
