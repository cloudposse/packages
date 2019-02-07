export VENDOR ?= iJanki
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_$(OS)_$(ARCH).tar.gz

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) version
