include ../../tasks/Makefile.vendor_includes

ifeq ($(OS), darwin)
  OS=macOS
else
  OS=Linux
endif

# Package details
export VENDOR ?= gohugoio
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_$(OS)-64bit.tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) version
