# Do not publish BSL licensed software

export AUTO_UPDATE_ENABLED := false

## Package - vault

export VENDOR ?= hashicorp
export PACKAGE_NAME ?= vault
export DOWNLOAD_URL ?= https://releases.hashicorp.com/$(PACKAGE_NAME)/$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_$(OS)_$(ARCH).zip
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

include ../../tasks/Makefile.vendor_includes


install:
	$(call download_zip)

test:
	$(PACKAGE_EXE) version
