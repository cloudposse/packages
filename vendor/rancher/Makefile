## Typical Github binary release

## Package details 
export VENDOR = rancher
export PACKAGE_NAME = rancher
# Folder which package is extracted into
export PACKAGE_REPO_NAME = cli
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/rancher-$(OS)-$(ARCH)-v$(PACKAGE_VERSION).tar.gz

## APK build specific requirements
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

include ../../tasks/Makefile.vendor_includes

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --version

## This may be required for apk building and varies from package to package
## Custom post-package processing (Note the double colon to append to current inherited package/prepare task)
package/prepare::
	mv src/rancher-v$(PACKAGE_VERSION)/rancher src
