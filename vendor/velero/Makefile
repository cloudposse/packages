export VENDOR = vmware-tanzu
export PACKAGE_NAME = velero
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)-v$(PACKAGE_VERSION)-$(OS)-$(ARCH).tar.gz

## APK build specific requirements
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

include ../../tasks/Makefile.vendor_includes

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) version --client-only | grep -F $(PACKAGE_VERSION)

## This is required for apk building and varies from package to package
package/prepare::
	mv src/$(PACKAGE_NAME)-v$(PACKAGE_VERSION)-$(OS)-$(ARCH)/$(PACKAGE_EXE) src/
