## Package - consul
include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

CURRENT_VERSION: QUERY=first(.[] | .name)
CURRENT_VERSION: API=tags

export VENDOR ?= hashicorp
export PACKAGE_NAME ?= consul
export DOWNLOAD_URL ?= https://releases.hashicorp.com/$(PACKAGE_NAME)/$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_$(OS)_$(ARCH).zip
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(call download_zip)

test:
	$(PACKAGE_EXE) version
