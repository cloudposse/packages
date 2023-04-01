include ../../tasks/Makefile.vendor_includes

# Package details
export VENDOR ?= dmlittle
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)-v$(PACKAGE_VERSION)-$(OS)-$(ARCH)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

# project is abandoned https://github.com/dmlittle/scenery
export PACKAGE_ENABLED = false
export AUTO_UPDATE_ENABLED = false


install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) --version

