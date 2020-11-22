export VENDOR ?= FairwindsOps
export PACKAGE_REPO_NAME ?= pluto
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/pluto_$(PACKAGE_VERSION)_$(OS)_$(ARCH).tar.gz
export APKBUILD_DEPENDS += libc6-compat

include ../../tasks/Makefile.vendor_includes

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) version
