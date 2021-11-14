include ../../tasks/Makefile.vendor_includes

# Package details
export VENDOR ?= opencredo
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat
export PACKAGE_DESCRIPTION = Terrahelp is as a command line utility that provides useful tricks like masking of terraform output.
# https://github.com/opencredo/terrahelp/releases/download/v0.7.5/terrahelp_0.7.5_linux_amd64.tar.gz
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_$(OS)_$(ARCH).tar.gz

install:
	$(call download_tar_gz)

test:
	$(PACKAGE_EXE) --version

