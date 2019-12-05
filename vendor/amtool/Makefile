export VENDOR ?= prometheus
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
#export APKBUILD_DEPENDS += libc6-compat musl
export PACKAGE_REPO_NAME = alertmanager
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/alertmanager-$(PACKAGE_VERSION).$(OS)-$(ARCH).tar.gz

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --version

package/prepare::
	mv src/alertmanager-$(PACKAGE_VERSION).$(OS)-$(ARCH)/$(PACKAGE_EXE) src