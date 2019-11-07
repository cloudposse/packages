include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

ifeq ($(OS), darwin)
  OS=macOS
else
  OS=Linux
endif

# Package details
export VENDOR ?= kamilsk
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_$(OS)-64bit.tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

# Releases are no longer published: https://github.com/kamilsk/retry/releases
export AUTO_UPDATE_ENABLED = false

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --help 2>&1 | grep Version
