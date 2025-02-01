## Package - spacectl
export VENDOR = hetznercloud
export PACKAGE_REPO_NAME = cli
export PACKAGE_EXE = hcloud
#      https://github.com/hetznercloud/cli/releases/download/v1.50.0/hcloud-linux-amd64.tar.gz
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_EXE)-$(OS)-$(ARCH).tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

## Uncomment only if you need additional libraries
# export APKBUILD_DEPENDS += libc6-compat

include ../../tasks/Makefile.vendor_includes

install:
	$(call download_tarball)

test:
	@echo "Testing $(PACKAGE_EXE) version with: $(PACKAGE_EXE) version"
	$(PACKAGE_EXE) version
	$(PACKAGE_EXE) version | grep -qF $(PACKAGE_VERSION)

## This may be required for apk building and varies from package to package
# Custom post-package processing (Note the double colon to append to current inherited package/prepare task)
#package/prepare::
#	mv src/$(PACKAGE_REPO_EXE) src/$(PACKAGE_EXE)
