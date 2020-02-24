## Package - nomad
export PACKAGE_ENABLED = false
include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

export VENDOR ?= hashicorp
export PACKAGE_NAME ?= nomad
export DOWNLOAD_URL ?= https://releases.hashicorp.com/$(PACKAGE_NAME)/$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_$(OS)_$(ARCH).zip
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat musl

install:
	$(call download_zip)

test:
	$(PACKAGE_EXE) version
