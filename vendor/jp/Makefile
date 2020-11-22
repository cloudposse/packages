## jp
include ../../tasks/Makefile.vendor_includes

export VENDOR = jmespath
export PACKAGE_NAME = jp
export DOWNLOAD_URL = $(PACKAGE_REPO_URL)/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_NAME)-$(OS)-$(ARCH)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) --version
