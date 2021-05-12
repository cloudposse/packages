## Package - spacectl
export VENDOR = spacelift-io
export PACKAGE_REPO_NAME = spacectl
export PACKAGE_EXE = spacectl
#  https://github.com/spacelift-io/spacectl/releases/download/v0.3.0/spacectl_0.3.0_darwin_amd64.zip
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_EXE)_$(PACKAGE_VERSION)_$(OS)_$(ARCH).zip
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

## Uncomment only if you need additional libraries
# export APKBUILD_DEPENDS += libc6-compat

include ../../tasks/Makefile.vendor_includes

install:
	$(call download_zip)

test:
	@echo "Testing $(PACKAGE_EXE) version with: $(PACKAGE_EXE) version"
	$(PACKAGE_EXE) version
	$(PACKAGE_EXE) version | grep -qF $(PACKAGE_VERSION)

## This may be required for apk building and varies from package to package
# Custom post-package processing (Note the double colon to append to current inherited package/prepare task)
#package/prepare::
#	mv src/$(PACKAGE_REPO_EXE) src/$(PACKAGE_EXE)
