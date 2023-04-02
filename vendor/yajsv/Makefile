
export VENDOR = neilpa
export PACKAGE_NAME = yajsv
export PACKAGE_REPO_NAME = yajsv
export DOWNLOAD_URL = $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME).$(OS).$(ARCH)

## APK build specific requirements
export APK_BUILD_TEMPLATE = APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat

include ../../tasks/Makefile.vendor_includes

# https://github.com/neilpa/yajsv/issues/24
ifneq ($(OS),darwin)
  export PACKAGE_ARCHS_DISABLED = arm64
endif

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) -v | grep -F $(PACKAGE_VERSION)
