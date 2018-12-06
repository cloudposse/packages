include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
export VENDOR ?= arsham
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/PACKAGE_RELEASEs/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(OS)_v$(PACKAGE_VERSION).tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat

# PACKAGE_RELEASEs: https://github.com/arsham/figurine/PACKAGE_RELEASEs
## Install figurine to generate fancy colorized ASCII banners
install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --help

