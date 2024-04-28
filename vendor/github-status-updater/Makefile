
# Package details
export VENDOR ?= cloudposse
export PACKAGE_EXE := github-status-updater
# https://github.com/cloudposse/github-status-updater/releases/download/0.9.0/github-status-updater_0.9.0_linux_amd64
# https://github.com/cloudposse/github-status-updater/releases/download/0.11.0/github-status-updater_0.11.0_linux_amd64.zip
export DOWNLOAD_URL = https://github.com/cloudposse/github-status-updater/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_EXE)_$(PACKAGE_VERSION)_$(OS)_$(ARCH).zip
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat

include ../../tasks/Makefile.vendor_includes

install: export PACKAGE_NAME = github-status-updater_v$(PACKAGE_VERSION)
install:
	$(call download_zip)

test:
	($(PACKAGE_EXE) --help || true) 2>&1 | grep "Usage of github-status-updater"

package/prepare::
	mv src/github-status-updater_v$(PACKAGE_VERSION) src/$(PACKAGE_EXE)
