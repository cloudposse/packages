include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk
include ../../tasks/Makefile.deb

# Package details
export VENDOR ?= cloudposse
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(OS)_$(ARCH)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat bash
export DEB_EXTRA_ARGS += --depends sudo

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) -c /bin/true || ($(PACKAGE_EXE) -c /bin/true 2>&1 || true) | grep "nobody is not in the sudoers file"
