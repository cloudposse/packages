include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
export VENDOR ?= arsham
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(OS)_v$(PACKAGE_VERSION).tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat

# Releases: https://github.com/arsham/figurine/releases
## Install figurine to generate fancy colorized ASCII banners
install:
	$(call download_tarball)

package/prepare::
	mv src/deploy/$(PACKAGE_EXE) src

test:
	$(PACKAGE_EXE) --help
