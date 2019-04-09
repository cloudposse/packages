export PACKAGE_REPO_NAME ?= kubernetes

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
export VENDOR ?= kubernetes
export DOWNLOAD_URL ?= https://storage.googleapis.com/kubernetes-release/release/v$(PACKAGE_VERSION)/bin/$(OS)/$(ARCH)/$(PACKAGE_NAME)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) --help
