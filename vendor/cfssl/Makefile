include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

export VENDOR = cloudflare
export PACKAGE_NAME = cfssl
export PACKAGE_REPO_NAME = cfssl
export DOWNLOAD_URL = $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/cfssl_$(PACKAGE_VERSION)_$(OS)_$(ARCH)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) version
