
export VENDOR ?= digitalocean
export PACKAGE_REPO_NAME ?= doctl
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat musl

include ../../tasks/Makefile.vendor_includes


export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)-$(PACKAGE_VERSION)-$(OS)-$(ARCH).tar.gz

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) version
