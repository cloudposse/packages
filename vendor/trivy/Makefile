## Package - trivy
include ../../tasks/Makefile.vendor_includes

ifeq ($(ARCH), amd64)
  ARCH=64bit
else ifeq ($(ARCH), arm64)
  ARCH=ARM64
endif

ifeq ($(OS), darwin)
  OS=macOS
else ifeq ($(OS), linux)
  OS=Linux
endif


export VENDOR = aquasecurity
export PACKAGE_NAME = trivy
export PACKAGE_REPO_NAME = trivy

# https://github.com/aquasecurity/trivy/releases/download/v0.43.0/trivy_0.43.0_Linux-ARM64.tar.gz
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_$(OS)-$(ARCH).tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --version
