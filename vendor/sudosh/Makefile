include ../../tasks/Makefile.vendor_includes

ifeq ($(OS), darwin)
  # There is no arm64 binary for darwin, but the amd64 binary works
  DL_ARCH = amd64
else ifeq ($(ARCH), arm64)
  # There is no arm64 binary for linux, but the arm binary works
  DL_ARCH = arm
else
  DL_ARCH = $(ARCH)
endif

# Package details
export VENDOR ?= cloudposse
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(OS)_$(DL_ARCH)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat bash
export DEB_FPM_EXTRA_ARGS += --depends sudo
export RPM_FPM_EXTRA_ARGS += --depends sudo

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) -c /bin/true || ($(PACKAGE_EXE) -c /bin/true 2>&1 || true) | grep "nobody is not in the sudoers file"
