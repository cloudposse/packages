# Package details
export VENDOR ?= gravitational
export PACKAGE_REPO_NAME = teleport
export MASTER_PACKAGE_NAME = teleport
export MAJOR_VERSION = 5.0
export PACKAGE_NAME = $(MASTER_PACKAGE_NAME)-$(MAJOR_VERSION)
# the -0 at the end of the pin allows prerelease candidates
export PACKAGE_VERSION_PIN = $(MAJOR_VERSION).x-0

# Starting with version 4.3, Teleport is not compatible with Alpine
export APK_PACKAGE_ENABLED = false
export DEB_PACKAGE_ENABLED = true

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk
include ../../tasks/Makefile.deb

export DOWNLOAD_URL ?= https://get.gravitational.com/teleport/$(PACKAGE_VERSION)/teleport-v$(PACKAGE_VERSION)-$(OS)-$(ARCH)-bin.tar.gz
export PACKAGE_EXE = teleport tctl tsh
export INSTALL_DIR = /usr/share/${MASTER_PACKAGE_NAME}/${MAJOR_VERSION}/bin

install:
	cd $(INSTALL_PATH) && $(CURL) -o - $(DOWNLOAD_URL) | tar --wildcards --strip-components=1 -zvx $(addprefix teleport/,$(PACKAGE_EXE))

test:
	pinned-package-sanity-check "$(PACKAGE_VERSION)" "$(MAJOR_VERSION)"
	teleport version | grep $(PACKAGE_VERSION)
	tsh version | grep $(PACKAGE_VERSION)
	tctl version | grep $(PACKAGE_VERSION)

package/prepare::
	@echo "make package/prepare ($(PACKAGE_EXE))"
	mv src/teleport src/dist
	echo $(PACKAGE_EXE) | tr ' ' '\n' | xargs -t -I{} -n1 mv -f src/dist/{} src/
