include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
export VENDOR ?= kubernetes
export DOWNLOAD_URL ?= https://storage.googleapis.com/kubernetes-release/release/v$(VERSION)/bin/$(OS)/$(ARCH)/$(NAME)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(call download_binary)

test:
	$(EXE) --help