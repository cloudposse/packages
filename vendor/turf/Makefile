# Package details
export VENDOR ?= cloudposse
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(OS)_$(ARCH)

include ../../tasks/Makefile.vendor_includes

# project is abandoned
export PACKAGE_ENABLED = false
export AUTO_UPDATE_ENABLED = false

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) version | grep -F $(PACKAGE_VERSION)
