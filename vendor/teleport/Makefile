include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
export VENDOR ?= gravitational
export DOWNLOAD_URL ?= https://get.gravitational.com/teleport/$(VERSION)/teleport-v$(VERSION)-$(OS)-$(ARCH)-bin.tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat musl
export EXE = teleport tctl tsh

install:
	echo $(call download_tarball)

test:
	teleport version
	tsh version
	tctl version

package/prepare::
	@echo "make package/prepare ($(EXE))"
	mv src/teleport src/dist
	echo $(EXE) | tr ' ' '\n' | xargs -t -I{} -n1 mv -f src/dist/{} src/
