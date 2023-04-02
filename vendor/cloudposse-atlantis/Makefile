export MASTER_PACKAGE_NAME = atlantis
export PACKAGE_REPO_NAME = atlantis

include ../../tasks/Makefile.vendor_includes

# Package details
export VENDOR ?= cloudposse
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_REPO_NAME)_$(OS)_$(ARCH)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += dpkg
export APKBUILD_INSTALL_SCRIPTS = $(PACKAGE_NAME).post-install $(PACKAGE_NAME).post-deinstall
export INSTALL_DIR = /usr/share/${MASTER_PACKAGE_NAME}/${VENDOR}/bin
export PACKAGE_EXE = atlantis

# This pacakge does not use semver, cannot be auto-updated
export AUTO_UPDATE_ENABLED = false

# Package has been abandoned/archived
# https://github.com/cloudposse/atlantis-experiments
export PACKAGE_ENABLED = false

# arm64 not supported
export PACKAGE_ARCHS_DISABLED = arm64

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) version | grep -F $(PACKAGE_VERSION)
