include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

ifeq ($(OS), darwin)
  OS=Darwin
else
  OS=Linux
endif

# Package details
export VENDOR ?= codefresh-io
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_$(OS)_x86_64.tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) version
