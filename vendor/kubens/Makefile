# Package details
export VENDOR ?= ahmetb
export REPO_NAME ?= kubectx
export DOWNLOAD_URL ?= https://raw.githubusercontent.com/ahmetb/kubectx/v$(VERSION)/$(NAME)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += bash

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

install:
	$(call download_binary)

test:
	$(EXE) -h
