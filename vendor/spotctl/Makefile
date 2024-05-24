
# Package details
export VENDOR ?= spotinst
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)-$(OS)-$(ARCH)-$(PACKAGE_VERSION).tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export AUTO_UPDATE_ENABLED := softfail

include ../../tasks/Makefile.vendor_includes

install:
	$(call download_tar_gz)

test:
	$(PACKAGE_EXE) version | grep -F $(PACKAGE_VERSION)

package/prepare::
	mv $$(find . -type f -name '$(PACKAGE_EXE)') src/
