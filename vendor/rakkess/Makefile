export VENDOR ?= corneliusweig
export PACKAGE_REPO_NAME ?= rakkess
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/rakkess-$(ARCH)-$(OS).tar.gz
export APKBUILD_DEPENDS += libc6-compat

include ../../tasks/Makefile.vendor_includes

# arm64 not supported
export PACKAGE_ARCHS_DISABLED = arm64

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) version

package/prepare::
	mv src/$(PACKAGE_NAME)-$(ARCH)-$(OS) src/$(PACKAGE_NAME)
