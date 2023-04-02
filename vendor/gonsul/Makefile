## Package - gonsul

export VENDOR = miniclip
export PACKAGE_NAME = gonsul
export PACKAGE_REPO_NAME = gonsul
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(OS)$(DL_ARCH)-$(PACKAGE_NAME).zip
export APK_BUILD_TEMPLATE ?= APKBUILD.github-zip

## Uncomment only if you need additional libraries
#export APKBUILD_DEPENDS += libc6-compat musl

# arm64 not supported
# for DEB and RPM, PACKAGE_ARCHS_DISABLED must be set before including the Makefile.vendor_includes.
# However, any `ifeq` statements must be after the include.
export PACKAGE_ARCHS_DISABLED = arm64

include ../../tasks/Makefile.vendor_includes

ifeq ($(OS),darwin)
 export OS = osx
 export DL_ARCH = -$(ARCH)
 export PACKAGE_ARCHS_DISABLED :=
else
 export DL_ARCH =
endif

install:
	$(call download_zip)

test:
	$(PACKAGE_EXE) -v

## This may be required for apk building and varies from package to package
# Custom post-package processing (Note the double colon to append to current inherited package/prepare task)
#package/prepare::
#	mv src/gonsul-$(OS).$(ARCH)/gonsul src
