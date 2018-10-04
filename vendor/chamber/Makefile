# Package details
export VENDOR ?= segmentio
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export DOWNLOAD_URL ?= $(REPO_URL)/releases/download/v$(VERSION)/$(NAME)-v$(VERSION)-$(OS)-$(ARCH)
export CHECK_COMMAND_ARGUMENTS ?= version

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

install:
	$(call download_binary)

test:
	$(EXE) version
