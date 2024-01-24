## Typical Github binary release

## Package details 
export VENDOR = rancher
export PACKAGE_NAME = rancher
# Folder which package is extracted into
export PACKAGE_REPO_NAME = cli
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/rancher-$(OS)-$(DL_ARCH)-v$(PACKAGE_VERSION).tar.gz

## APK build specific requirements
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

include ../../tasks/Makefile.vendor_includes

ifeq ($(OS),darwin)
  # arm64 not supported on macOS, but add "no-linux" to say no linux architectures are disabled
  export PACKAGE_ARCHS_DISABLED = arm64 no-linux
endif
ifeq ($(ARCH),arm64)
  export DL_ARCH = arm
else
  export DL_ARCH = $(ARCH)
endif

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --version

## This may be required for apk building and varies from package to package
## Custom post-package processing (Note the double colon to append to current inherited package/prepare task)
package/prepare::
	mv src/rancher-v$(PACKAGE_VERSION)/rancher src
