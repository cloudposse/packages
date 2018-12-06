include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
export VENDOR ?= alecthomas
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/PACKAGE_RELEASEs/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)-$(PACKAGE_VERSION)-$(OS)-$(ARCH).tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --version

package/prepare::
	mv src/$(PACKAGE_NAME)-$(PACKAGE_VERSION)-$(OS)-$(ARCH)/$(PACKAGE_NAME) src
