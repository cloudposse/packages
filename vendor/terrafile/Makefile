include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

ifeq ($(OS), darwin)
  OS=Darwin
else
  OS=Linux
endif

# Package details
export VENDOR ?= coretech
export DOWNLOAD_URL ?= $(REPO_URL)/releases/download/v$(VERSION)/$(PACKAGE_NAME)_$(VERSION)_$(OS)_$(OS_ARCH).tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(call download_tarball)

test:
	$(EXE) version
