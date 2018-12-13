export PACKAGE_EXE ?= atlantis
export PACKAGE_REPO_NAME ?= atlantis

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
export VENDOR ?= cloudposse
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_EXE)_$(OS)_$(ARCH)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat

install:
	$(call download_binary)

test:
	($(PACKAGE_EXE) || true) 2>&1 | grep token
