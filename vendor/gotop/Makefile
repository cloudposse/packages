include ../../tasks/Makefile.vendor_includes

# Package details
export VENDOR ?= cjbassi
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_$(OS)_$(DL_ARCH).tgz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat

ifeq ($(OS),darwin)
  # arm64 not supported
  export PACKAGE_ARCHS_DISABLED = arm64
  export DL_ARCH = $(ARCH)
else ifeq ($(ARCH),arm64)
  export DL_ARCH = arm8
endif

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --version
