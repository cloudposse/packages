export VENDOR ?= corneliusweig
export PACKAGE_REPO_NAME ?= rakkess
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/rakkess-$(OS)-$(ARCH).gz

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

install:
	$(call download_binary_gz)

test:
	$(PACKAGE_EXE) version
