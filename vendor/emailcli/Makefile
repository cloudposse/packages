# Package details
export VENDOR ?= wrouesnel
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export DOWNLOAD_URL ?= $(REPO_URL)/releases/download/$(VERSION)/email
export APKBUILD_DEPENDS += ca-certificates
export EXE = email

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

install:
	$(call download_binary)

test:
	$(EXE) --version
