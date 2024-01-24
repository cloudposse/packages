
export VENDOR = neilpa
export PACKAGE_NAME = yajsv
export PACKAGE_REPO_NAME = yajsv
export DOWNLOAD_URL = $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME).$(OS).$(ARCH)

## APK build specific requirements
export APK_BUILD_TEMPLATE = APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat

# https://github.com/neilpa/yajsv/issues/24
ifeq ($(OS),darwin)
  # Set PACKAGE_ARCHS_DISABLED to "other" to indicate that this package is not available for some architectures on other OSes
  export PACKAGE_ARCHS_DISABLED := "other"
else
  export PACKAGE_ARCHS_DISABLED = arm64
endif

include ../../tasks/Makefile.vendor_includes

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) -v | grep -F $(PACKAGE_VERSION)
