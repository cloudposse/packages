
# Package details
export VENDOR ?= cloudposse
# https://github.com/cloudposse/github-status-updater/releases/download/0.9.0/github-status-updater_0.9.0_linux_amd64
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_$(OS)_$(ARCH)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat

include ../../tasks/Makefile.vendor_includes

install:
	$(call download_binary)

test:
	($(PACKAGE_EXE) --help || true) 2>&1 | grep "Usage of github-status-updater"
