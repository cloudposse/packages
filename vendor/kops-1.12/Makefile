export APK_PACKAGE_NAME = kops_1.12
export DOWNLOAD_URL ?= https://github.com/kubernetes/kops/releases/download/$(PACKAGE_VERSION)/kops-$(OS)-$(ARCH)

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
#
export VENDOR ?= kubernetes
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) version
