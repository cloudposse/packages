## Package - vault
export GITHUB_VERSION := $(shell cat VERSION)
export PACKAGE_VERSION := $(shell echo ${GITHUB_VERSION} | sed -E 's/\-beta([0-9]+)/b\1/')

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk
include ../../tasks/Makefile.deb

export VENDOR ?= hashicorp
export PACKAGE_NAME ?= vault
export DOWNLOAD_URL ?= https://releases.hashicorp.com/$(PACKAGE_NAME)/$(GITHUB_VERSION)/$(PACKAGE_NAME)_$(GITHUB_VERSION)_$(OS)_$(ARCH).zip
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

CURRENT_VERSION: QUERY=first(.[] | .name)
CURRENT_VERSION: API=tags

install:
	$(call download_zip)

test:
	$(PACKAGE_EXE) version
