ifeq (3.7.,$(findstring 3.7.,$(shell cat /etc/alpine-release 2>/dev/null)))
export PACKAGE_ENABLED = false
else ifeq (3.8.,$(findstring 3.8.,$(shell cat /etc/alpine-release 2>/dev/null)))
export PACKAGE_ENABLED = false
else ifeq (3.9.,$(findstring 3.9.,$(shell cat /etc/alpine-release 2>/dev/null)))
export PACKAGE_ENABLED = false
else
export PACKAGE_ENABLED = true
endif

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk
include ../../tasks/Makefile.deb

# Package details
export VENDOR ?= gravitational
export DOWNLOAD_URL ?= https://get.gravitational.com/teleport/$(PACKAGE_VERSION)/teleport-v$(PACKAGE_VERSION)-$(OS)-$(ARCH)-bin.tar.gz
# Starting with version 4.3, Teleport is not compatible with Alpine
# so we disable updates
export AUTO_UPDATE_ENABLED = false
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat musl eudev-dev
export PACKAGE_EXE = teleport tctl tsh

install:
	cd $(INSTALL_PATH) && $(CURL) -o - $(DOWNLOAD_URL) | tar --wildcards --strip-components=1 -zvx $(addprefix teleport/,$(PACKAGE_EXE))

test:
	teleport version | grep $(PACKAGE_VERSION)
	tsh version | grep $(PACKAGE_VERSION)
	tctl version | grep $(PACKAGE_VERSION)

package/prepare::
	@echo "make package/prepare ($(PACKAGE_EXE))"
	mv src/teleport src/dist
	echo $(PACKAGE_EXE) | tr ' ' '\n' | xargs -t -I{} -n1 mv -f src/dist/{} src/
