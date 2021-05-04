## Package - spacectl
export VENDOR = spacelift-io
export PACKAGE_REPO_NAME = spacectl
export PACKAGE_EXE = spacectl
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_EXE)-$(OS)-$(ARCH).tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

## Uncomment only if you need additional libraries
# export APKBUILD_DEPENDS += libc6-compat

include ../../tasks/Makefile.vendor_includes

install:
	$(call download_tar_gz)

test:
	# Our normal test does not work, because the package does not (yet) support a "version" output
	# $(PACKAGE_EXE) --version | grep -F $(PACKAGE_VERSION)
	$(PACKAGE_EXE) help

## This may be required for apk building and varies from package to package
# Custom post-package processing (Note the double colon to append to current inherited package/prepare task)
#package/prepare::
#	mv src/$(PACKAGE_REPO_EXE) src/$(PACKAGE_EXE)
