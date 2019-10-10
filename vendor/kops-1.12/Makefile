export PACKAGE_NAME = kops-1.12
export DOWNLOAD_URL = https://github.com/kubernetes/kops/releases/download/$(PACKAGE_VERSION)/kops-$(OS)-$(ARCH)

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
#
export VENDOR = kubernetes
export APK_BUILD_TEMPLATE = APKBUILD.github-binary
export APKBUILD_DEPENDS += dpkg
export APKBUILD_INSTALL_SCRIPTS += $(PACKAGE_NAME).post-install $(PACKAGE_NAME).post-deinstall

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) version
