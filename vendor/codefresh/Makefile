# Package details
export OS ?= $(shell uname -s | tr '[:upper:]' '[:lower:'])
export DISTR ?= $(shell grep ^ID= /etc/os-release 2>/dev/null | cut -d= -f2 | tr '[:upper:]' '[:lower:'])

ifeq ($(OS),darwin)
	OS=macos
endif

ifeq ($(DISTR),alpine)
	OS=alpine
endif

export VENDOR ?= codefresh-io
export PACKAGE_REPO_NAME ?= cli
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/codefresh-v$(PACKAGE_VERSION)-$(OS)-x64.tar.gz
export APKBUILD_DEPENDS += ca-certificates

## Required for testing on build
export CFCONFIG ?= ./src/.cfconfig

export PACKAGE_EXE = codefresh

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk
include ../../tasks/Makefile.deb

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) version
