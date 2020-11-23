include ../../tasks/Makefile.vendor_includes

# Package details
export VENDOR ?= cloudposse
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(OS)_$(ARCH)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat

install:
	echo $(DOWNLOAD_URL)
	$(call download_binary)

test:
	($(PACKAGE_EXE) || true) 2>&1 | grep author_icon
