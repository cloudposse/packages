include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
export VENDOR ?= zricethezav
export DOWNLOAD_URL ?= $(REPO_URL)/releases/download/v$(VERSION)/$(PACKAGE_NAME)-$(OS)-$(ARCH)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(call download_binary)

test:
	$(EXE) --version
