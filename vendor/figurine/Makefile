include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
export VENDOR ?= arsham
export DOWNLOAD_URL ?= $(REPO_URL)/releases/download/v$(VERSION)/$(NAME)_$(OS)_v$(VERSION).tar.gz 
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat

# Releases: https://github.com/arsham/figurine/releases
## Install figurine to generate fancy colorized ASCII banners
install:
	$(call download_tarball)
	chmod +x $(INSTALL_PATH)/figurine

test:
	$(EXE) --help

