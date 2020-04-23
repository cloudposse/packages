export VENDOR ?= mumoshu
export PACKAGE_REPO_NAME ?= variant2
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/variant_$(PACKAGE_VERSION)_$(OS)_$(ARCH).tar.gz

export PACKAGE_EXE = variant
export PACKAGE_DESCRIPTION = Variant is a Universal CLI tool that works like a task runner

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE)
