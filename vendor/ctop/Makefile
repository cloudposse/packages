# Package details
export VENDOR ?= bcicen
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
# https://github.com/bcicen/ctop/releases/download/0.7.6/ctop-0.7.6-linux-amd64
# https://github.com/bcicen/ctop/releases/download/v0.7.7/ctop-0.7.7-linux-amd64
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)-$(PACKAGE_VERSION)-$(OS)-$(ARCH)
export APKBUILD_DEPENDS += libc6-compat

include ../../tasks/Makefile.vendor_includes

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) -v
