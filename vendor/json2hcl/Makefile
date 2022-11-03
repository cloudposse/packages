include ../../tasks/Makefile.vendor_includes

# Package details
export VENDOR ?= kvz
# https://github.com/kvz/json2hcl/releases/download/v0.1.1/json2hcl_0.1.1_linux_amd64.tar.gz
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_$(OS)_$(ARCH).tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(call download_tar_gz)

test:
	$(PACKAGE_EXE) --version
	# --version does not return the correct version, just "development"
	# $(PACKAGE_EXE) --version | grep -F $(PACKAGE_VERSION)
