# Package details
export VENDOR ?= codefresh-io
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export DOWNLOAD_URL ?= $(REPO_URL)/releases/download/v$(VERSION)/codefresh
export APKBUILD_DEPENDS += ca-certificates
export EXE = codefresh

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

install:
	$(call download_binary)

test:
	$(EXE) --version
