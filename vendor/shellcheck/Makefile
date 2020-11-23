
# Package details
export VENDOR ?= koalaman
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)-v${PACKAGE_VERSION}.$(OS).x86_64.tar.xz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

# Shell check has releases called "stable" and "latest" but they are very old, so ignore them
export PACKAGE_VERSION_SEMVER_XFORM = sed -E 's/(stable|latest)/0.0.0/g'

include ../../tasks/Makefile.vendor_includes

install:
	$(call download_tar_xz)

test:
	$(PACKAGE_EXE) --version | grep -F $(PACKAGE_VERSION)

package/prepare::
	mv src/shellcheck-v$(PACKAGE_VERSION)/shellcheck src
