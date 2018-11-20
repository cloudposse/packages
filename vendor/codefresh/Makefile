# Package details
export VENDOR ?= codefresh-io
export REPO_NAME ?= cli
export NAME ?= codefresh
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export DOWNLOAD_URL ?= $(REPO_URL)/releases/download/v$(VERSION)/codefresh-v$(VERSION)-$(OS)-x64.tar.gz
export APKBUILD_DEPENDS += ca-certificates
export EXE = codefresh

ifeq ($(ARCH), darwin)
  OS=macos
else
  OS=linux
endif

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

install:
	$(call download_binary)

test:
	$(EXE) --version
