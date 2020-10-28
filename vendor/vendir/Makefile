include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk
include ../../tasks/Makefile.deb

# Package details
export VENDOR ?= k14s
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)-$(OS)-$(ARCH)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export PACKAGE_DESCRIPTION = Easy way to vendor portions of git repos, github releases, etc. declaratively

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) version
