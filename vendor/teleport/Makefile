include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
export VENDOR ?= gravitational
export DOWNLOAD_URL ?= https://get.gravitational.com/teleport/$(VERSION)/teleport-v$(VERSION)-$(OS)-$(ARCH)-bin.tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat

install:
	$(call download_tarball)

test:
	$(EXE) version

package/prepare::
	mv src/$(NAME) src/tmp
	mv src/tmp/$(NAME) src
