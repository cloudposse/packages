# Package details
export VENDOR ?= mvdan
export DOWNLOAD_URL ?= $(REPO_URL)/releases/download/v$(VERSION)/shfmt_v$(VERSION)_$(OS)_$(ARCH)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export REPO_NAME ?= sh

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

install:
	$(call download_binary)

test:
	$(EXE) --version