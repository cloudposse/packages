include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

ifeq ($(OS), darwin)
  OS=osx
endif

# Package details
export VENDOR ?= wjdp
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_$(OS)_$(ARCH).tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --version
