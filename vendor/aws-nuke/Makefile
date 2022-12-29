export VENDOR ?= rebuy-de
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export PACKAGE_REPO_NAME = aws-nuke
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_REPO_NAME)-v$(PACKAGE_VERSION)-$(OS)-$(ARCH).tar.gz

include ../../tasks/Makefile.vendor_includes

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) version

package/prepare::
	mv $${APK_TMP_DIR}/src/$(PACKAGE_REPO_NAME)-v$(PACKAGE_VERSION)-$(OS)-$(ARCH) $${APK_TMP_DIR}/src/$(PACKAGE_NAME)
