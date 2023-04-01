include ../../tasks/Makefile.vendor_includes

DOWNLOAD_ARCH = $(if $(subst arm64,,$(ARCH)),$(ARCH),arm8)

# Package details
export VENDOR = junegunn
export PACKAGE_NAME = fzf
export PACKAGE_REPO_NAME = fzf-bin
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_NAME)-$(PACKAGE_VERSION)-$(OS)_$(DOWNLOAD_ARCH).tgz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --version
