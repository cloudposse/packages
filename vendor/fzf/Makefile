include ../../tasks/Makefile.vendor_includes

# Package details
export VENDOR = junegunn
export PACKAGE_NAME = fzf
export PACKAGE_REPO_NAME = fzf
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_NAME)-$(PACKAGE_VERSION)-$(OS)_$(ARCH).tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --version
