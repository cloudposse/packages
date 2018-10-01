# Package details
export VENDOR ?= kubernetes-sigs
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export DOWNLOAD_URL ?= $(REPO_URL)/releases/download/v$(VERSION)/heptio-authenticator-aws_$(VERSION)_$(OS)_$(ARCH)
export CHECK_COMMAND_ARGUMENTS ?= --help

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

install:
	$(call download_binary)