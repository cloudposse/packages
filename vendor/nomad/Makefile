# Do not publish BSL licensed software

export AUTO_UPDATE_ENABLED := false

## Package - nomad
# Hashicorp publishes packages for nomad: https://learn.hashicorp.com/tutorials/nomad/get-started-install
export PACKAGE_ENABLED = false
include ../../tasks/Makefile.vendor_includes

export VENDOR ?= hashicorp
export PACKAGE_NAME ?= nomad
export DOWNLOAD_URL ?= https://releases.hashicorp.com/$(PACKAGE_NAME)/$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_$(OS)_$(ARCH).zip
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat musl

install:
	$(call download_zip)

test:
	$(PACKAGE_EXE) version
