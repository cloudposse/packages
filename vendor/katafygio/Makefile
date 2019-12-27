## Typical Github binary release

## Package details 
export VENDOR = bpineau
export PACKAGE_NAME = katafygio
export PACKAGE_REPO_NAME = katafygio
export DOWNLOAD_URL = $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_$(OS)_$(ARCH)

## APK build specific requirements
export APK_BUILD_TEMPLATE = APKBUILD.github-binary

## Uncomment only if you need additional libraries
export APKBUILD_DEPENDS += libc6-compat musl

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) version
