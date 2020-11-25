include ../../tasks/Makefile.vendor_includes

# Package details
export VENDOR ?= tianon
GITHUB_VERSION = $(shell echo $(PACKAGE_VERSION) | sed -E 's/\.0$$//')
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/$(GITHUB_VERSION)/$(PACKAGE_NAME)-$(ARCH)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(call download_binary)

test:
	($(PACKAGE_EXE) || true) 2>&1 | grep version

