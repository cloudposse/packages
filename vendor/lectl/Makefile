

export OS_ARCH = noarch
export PACKAGE_DIST_ARCH = noarch
# Distribution is a script that runs on any architecture,
# so we do not need to build it for each architecture.
# We choose amd64 (the best supported architecture) to build the package.
export PACKAGE_ARCHS_DISABLED = arm64

# Package details
export VENDOR ?= sahsanu
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += util-linux bash
export DEB_FPM_EXTRA_ARGS += --depends bsdmainutils
# prior to v0.23.0, versions did not have a trailing .0, they were like v0.22
# GITHUB_VERSION = $(shell echo $(PACKAGE_VERSION) | sed -E 's/\.0$$//')
export DOWNLOAD_URL ?= https://raw.githubusercontent.com/sahsanu/lectl/v$(PACKAGE_VERSION)/lectl

include ../../tasks/Makefile.vendor_includes

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) --version
