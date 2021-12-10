# As of v8.0, gitleaks is only available for x86
PACKAGE_ENABLED = $(if $(subst amd64,,$(ARCH)),false,true)

include ../../tasks/Makefile.vendor_includes

# Package details
export VENDOR ?= zricethezav
# https://github.com/zricethezav/gitleaks/releases/download/v8.0.2/gitleaks_8.0.2_darwin_x64.tar.gz
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_$(OS)_x64.tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(call download_tar_gz)

test:
	$(PACKAGE_EXE) version | grep -F $(PACKAGE_VERSION)
