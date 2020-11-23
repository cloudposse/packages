## Typical Github binary release

## Package details 
export VENDOR = buildpacks
export PACKAGE_NAME = pack
export PACKAGE_REPO_NAME = pack
export DOWNLOAD_URL = $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/pack-v$(PACKAGE_VERSION)-$(OS).tgz

## APK build specific requirements
export APK_BUILD_TEMPLATE = APKBUILD.github-binary

include ../../tasks/Makefile.vendor_includes

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --version

