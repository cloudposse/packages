## Package - trivy
include ../../tasks/Makefile.vendor_includes

export VENDOR = aquasecurity
export PACKAGE_NAME = trivy
export PACKAGE_REPO_NAME = trivy
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_$(OS)-64bit.tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --version
