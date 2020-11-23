include ../../tasks/Makefile.vendor_includes

# Package details
export VENDOR ?= jgm
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_NAME)-$(PACKAGE_VERSION)-$(OS)-$(ARCH).tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat

install:
	$(call download_tar_gz)

test:
	$(PACKAGE_EXE) -v

package/prepare::
	mv $$(find . -type f -name 'pandoc') src/
