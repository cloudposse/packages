# Package details
export MASTER_PACKAGE_NAME = teleport
export PACKAGE_NAME = $(MASTER_PACKAGE_NAME)
export MAJOR_VERSION = latest

export PACKAGE_TYPES_DISABLED = apk

include ../../tasks/Makefile.vendor_includes

# Package details
export VENDOR ?= gravitational
# By version 16, we could just download and republish the packages, but that is extra work for us.
# https://cdn.teleport.dev/teleport-v16.0.3-linux-arm64-bin.tar.gz
export DOWNLOAD_URL ?= https://cdn.teleport.dev/teleport-v$(PACKAGE_VERSION)-$(OS)-$(ARCH)-bin.tar.gz
# so we disable updates
# export AUTO_UPDATE_ENABLED = false
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat musl eudev-dev dpkg
export PACKAGE_EXE = teleport tctl tsh
export INSTALL_DIR = /usr/share/${MASTER_PACKAGE_NAME}/${MAJOR_VERSION}/bin

install:
	cd $(INSTALL_PATH) && $(CURL) -o - $(DOWNLOAD_URL) | tar --strip-components=1 -zvx $(addprefix teleport/,$(PACKAGE_EXE))

test:
	teleport version | grep -F $(PACKAGE_VERSION)
	tsh version | grep -F $(PACKAGE_VERSION)
	tctl version | grep -F $(PACKAGE_VERSION)

package/prepare::
	@echo "make package/prepare ($(PACKAGE_EXE))"
	mv src/teleport src/dist
	echo $(PACKAGE_EXE) | tr ' ' '\n' | xargs -t -I{} -n1 mv -f src/dist/{} src/
