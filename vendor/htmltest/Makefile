include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

ifeq ($(OS), darwin)
  OS=osx
endif

# Package details
export VENDOR ?= wjdp
export DOWNLOAD_URL ?= $(REPO_URL)/releases/download/v$(VERSION)/$(PACKAGE_NAME)_$(VERSION)_$(OS)_$(ARCH).tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat

install:
	$(call download_tarball)

test:
	$(EXE) --version
