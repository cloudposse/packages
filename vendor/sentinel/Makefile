## Package - sentinel

## Sentinel is not an open source, so we don't want to distribute it
export PACKAGE_ENABLED = false
export AUTO_UPDATE_ENABLED = false

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk
include ../../tasks/Makefile.deb

export VENDOR ?= hashicorp
export PACKAGE_NAME ?= sentinel
export DOWNLOAD_URL ?= https://releases.hashicorp.com/$(PACKAGE_NAME)/$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_$(OS)_$(ARCH).zip
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(call download_zip)

test:
	$(PACKAGE_EXE) version
