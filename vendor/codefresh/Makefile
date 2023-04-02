# Package details
export VENDOR ?= codefresh-io
export PACKAGE_REPO_NAME ?= cli
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/codefresh-v$(PACKAGE_VERSION)-$(OS)-x64.tar.gz
export APKBUILD_DEPENDS += ca-certificates

## Required for testing on build
export CFCONFIG ?= ./src/.cfconfig

export PACKAGE_EXE = codefresh

include ../../tasks/Makefile.vendor_includes

ifeq ($(OS),darwin)
	OS=macos
endif

ifeq ($(DIST_DISTRIBUTION),alpine)
	OS=alpine
endif

# arm64 not supported
export PACKAGE_ARCHS_DISABLED = arm64

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) version
