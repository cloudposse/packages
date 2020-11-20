include ../../tasks/Makefile.vendor_includes

# Package details
# NOTE: vert is a tool used by our Make recipies and so it has to be able to be installed
# while making other packages. We cannot rely on default values of any of the variables
# because they may be set for a different package.
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
