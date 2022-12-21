# Package details
export VENDOR ?= gruntwork-io
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(OS)_$(ARCH)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
#export APKBUILD_DEPENDS += # add dependencies here

include ../../tasks/Makefile.vendor_includes

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) version
