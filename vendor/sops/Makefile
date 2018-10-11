include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
export VENDOR ?= mozilla
export DOWNLOAD_URL ?= $(REPO_URL)/releases/download/$(VERSION)/$(NAME)-$(VERSION).$(OS)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(call download_binary)

test:
	$(EXE) --version
