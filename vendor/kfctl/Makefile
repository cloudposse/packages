export VENDOR ?= kubeflow
export PACKAGE_REPO_NAME ?= kubeflow
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
export DOWNLOAD_URL ?= https://github.com/$(VENDOR)/$(PACKAGE_REPO_NAME)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_v$(PACKAGE_VERSION)_$(OS).tar.gz

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --help
