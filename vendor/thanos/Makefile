include ../../tasks/Makefile.vendor_includes

export VENDOR ?= thanos-io
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)-$(PACKAGE_VERSION).$(OS)-$(ARCH).tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

## This may be required for apk building and varies from package to package
## Custom post-package processing (Note the double colon to append to current inherited package/prepare task)
package/prepare::
	mv src/$(PACKAGE_NAME)-$(PACKAGE_VERSION).$(OS)-$(ARCH)/$(PACKAGE_NAME) src/

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --version
