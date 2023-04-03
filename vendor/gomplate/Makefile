include ../../tasks/Makefile.vendor_includes

# Package details
export VENDOR ?= hairyhenderson
# We used to package the "slim" version of the binary, but those are now deprecated, and don't work on arm64.
# See https://github.com/hairyhenderson/gomplate/issues/1348
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(OS)-$(ARCH)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) --version

