include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
export VENDOR ?= aktau
export DOWNLOAD_URL ?= $(REPO_URL)/releases/download/v$(VERSION)/$(OS)-$(ARCH)-$(PACKAGE_NAME).tar.bz2
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(call download_tar_bz2)

test:
	$(EXE) --version

package/prepare::
	mv src/bin/$(OS)/$(ARCH)/$(EXE) src
