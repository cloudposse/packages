include ../../tasks/Makefile.vendor_includes

export VENDOR = neilpa
export PACKAGE_NAME = yajsv
export PACKAGE_REPO_NAME = yajsv
export DOWNLOAD_URL = $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME).$(OS).$(ARCH)

## APK build specific requirements
export APK_BUILD_TEMPLATE = APKBUILD.github-binary

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) version
