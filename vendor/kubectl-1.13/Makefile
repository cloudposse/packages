export PACKAGE_NAME = kubectl-1.13
export PACKAGE_REPO_NAME = kubernetes

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
export VENDOR = kubernetes
export DOWNLOAD_URL = https://storage.googleapis.com/kubernetes-release/release/v$(PACKAGE_VERSION)/bin/$(OS)/$(ARCH)/kubectl
export APK_BUILD_TEMPLATE = APKBUILD.github-binary
export APKBUILD_DEPENDS += dpkg
export APKBUILD_INSTALL_SCRIPTS += $(PACKAGE_NAME).post-install $(PACKAGE_NAME).post-deinstall

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) --help
