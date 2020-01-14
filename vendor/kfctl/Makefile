export VENDOR ?= kubeflow
export PACKAGE_REPO_NAME ?= kubeflow
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
export DOWNLOAD_URL := $(shell env PATH=$(PATH) github-repo-metadata $(VENDOR) $(PACKAGE_REPO_NAME) 'releases/tags/v$(PACKAGE_VERSION)' '.assets | .[] | .browser_download_url | select(.|contains("$(OS)"))')

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --help
