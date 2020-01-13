## Typical Github binary release

## Package details 
export VENDOR = prometheus
export PACKAGE_NAME = promtool
export PACKAGE_REPO_NAME = prometheus
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/prometheus-$(PACKAGE_VERSION).$(OS)-$(ARCH).tar.gz

## APK build specific requirements
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
## Uncomment only if you need additional libraries
#export APKBUILD_DEPENDS += libc6-compat musl

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --version

package/prepare::
	mv src/prometheus-$(PACKAGE_VERSION).$(OS)-$(ARCH)/$(PACKAGE_EXE) src
