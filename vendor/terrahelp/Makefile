include ../../tasks/Makefile.vendor_includes

# Package details
export VENDOR ?= opencredo
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)-$(OS)-$(ARCH)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat
export PACKAGE_DESCRIPTION = Terrahelp is as a command line utility that provides useful tricks like masking of terraform output.

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) --version

