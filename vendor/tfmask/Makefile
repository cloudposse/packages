include ../../tasks/Makefile.vendor_includes

# Package details
export VENDOR ?= cloudposse
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(OS)_$(ARCH)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat

# project is abandoned
export PACKAGE_ENABLED = false
export AUTO_UPDATE_ENABLED = false

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) < /dev/null
