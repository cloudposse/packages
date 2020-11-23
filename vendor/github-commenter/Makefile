# Package details
export VENDOR ?= cloudposse
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(OS)_$(ARCH)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat
export DOWNLOAD_TARGET ?= download/binary

include ../../tasks/Makefile.vendor_includes

install: $(INSTALL_PATH)/$(PACKAGE_NAME)

test:
	($(PACKAGE_EXE) || true) 2>&1 | grep token

.SECONDARY:
$(INSTALL_PATH)/$(PACKAGE_NAME): $(DOWNLOAD_TARGET)
