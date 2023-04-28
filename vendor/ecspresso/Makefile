
export VENDOR ?= kayac
export PACKAGE_REPO_NAME ?= ecspresso
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

include ../../tasks/Makefile.vendor_includes


export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)-$(PACKAGE_VERSION)-$(OS)-$(ARCH).tar.gz

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) version
