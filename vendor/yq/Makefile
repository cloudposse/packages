# Package details
export VENDOR ?= mikefarah
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export DOWNLOAD_URL ?= $(REPO_URL)/releases/download/$(VERSION)/$(NAME)_$(OS)_$(ARCH)

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

install:
	$(call download_binary)

test:
	$(EXE) --version
