export VENDOR ?= kubeflow
export PACKAGE_REPO_NAME ?= kfctl
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat

# arm64 not supported
export PACKAGE_ARCHS_DISABLED = arm64

include ../../tasks/Makefile.vendor_includes

# Package details
export DOWNLOAD_URL := $(shell env PATH='$(PATH)' github-repo-metadata $(VENDOR) $(PACKAGE_REPO_NAME) 'releases/tags/v$(PACKAGE_VERSION)' '.assets | .[] | .browser_download_url | select(.|contains("$(OS)"))')

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --help
