include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk
include ../../tasks/Makefile.deb

# Package details
export VENDOR = Masterminds
export PACKAGE_NAME = vert
export PACKAGE_EXE = vert
export PACKAGE_REPO_NAME = vert
export PACKAGE_REPO_URL = https://github.com/$(VENDOR)/$(PACKAGE_REPO_NAME)
export PACKAGE_VERSION = $(shell cat VERSION 2>/dev/null)
export DOWNLOAD_URL = $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)-v$(PACKAGE_VERSION)-linux-amd64
export APK_BUILD_TEMPLATE = APKBUILD.github-binary

install:
	$(call download_binary)

test:
	exit 0
