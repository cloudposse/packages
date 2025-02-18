# Package details
export VENDOR ?= codefresh-io
export PACKAGE_REPO_NAME ?= cli
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/codefresh-v$(PACKAGE_VERSION)-$(OS)-$(ARCH).tar.gz
export APKBUILD_DEPENDS += ca-certificates

# Seems like this is no longer required
#	## Required for testing on build
#	export CFCONFIG ?= ./src/.cfconfig

export PACKAGE_EXE = codefresh

include ../../tasks/Makefile.vendor_includes

ifeq ($(DIST_DISTRIBUTION),alpine)
	OS=alpine
endif

ifeq ($(ARCH),amd64)
	ARCH=x64
endif


# arm64 not supported on macOS or Windows
# We could do it this way, to indicate that this package is not available for arm64 on macOS
#
#		ifeq ($(OS),darwin)
#		  export PACKAGE_ARCHS_DISABLED = arm64
#		else
#		  # Set PACKAGE_ARCHS_DISABLED to "other" to indicate that this package is not available for some architectures on other OSes
#		  export PACKAGE_ARCHS_DISABLED := "other"
#		endif
#
# However, you can currently run amd64 on arm64 CPUs on macOS, and we do not actually create a package for macOS
# so we just install the amd64 version on macOS
ifeq ($(OS),darwin)
	OS=macos
	ARCH=x64
endif

# Linux arm64 is supported starting with version 0.86.0
# Alpine arm64 is not supported until v0.87.4 but we do not care because we do not package arm64 for Alpine

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) version | grep -F $(PACKAGE_VERSION)
