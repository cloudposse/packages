
# Package details
export VENDOR ?= cjbassi
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_$(OS)_$(DL_ARCH).tgz
export APKBUILD_DEPENDS += libc6-compat

include ../../tasks/Makefile.vendor_includes

ifeq ($(OS),darwin)
  # arm64 not supported
  export PACKAGE_ARCHS_DISABLED = arm64
endif
ifeq ($(ARCH),arm64)
  export DL_ARCH = arm8
else
  export DL_ARCH = $(ARCH)
endif

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --version
