# Package details
export VENDOR ?= ahmetb
export PACKAGE_REPO_NAME ?= kubectx
export DOWNLOAD_URL ?= https://raw.githubusercontent.com/ahmetb/kubectx/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += bash kubectl

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) -h
