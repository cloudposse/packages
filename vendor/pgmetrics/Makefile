## Typical Github binary release

## Package details 
export VENDOR = rapidloop
export PACKAGE_NAME = pgmetrics
export PACKAGE_REPO_NAME = pgmetrics
export DOWNLOAD_URL = $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/pgmetrics_$(PACKAGE_VERSION)_$(OS)_$(ARCH).tar.gz

## APK build specific requirements
export APK_BUILD_TEMPLATE = APKBUILD.github-binary
## Uncomment only if you need additional libraries
#export APKBUILD_DEPENDS += libc6-compat musl

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --V

## This may be required for apk building and varies from package to package
## Custom post-package processing (Note the double colon to append to current inherited package/prepare task)
package/prepare::
	mv src/pgmetrics_$(PACKAGE_VERSION)_$(OS)_$(ARCH)/pgmetrics src
