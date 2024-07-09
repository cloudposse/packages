# Package details
export VENDOR ?= gravitational
export PACKAGE_REPO_NAME = teleport
export MASTER_PACKAGE_NAME = teleport
export MAJOR_VERSION = 4.4
export PACKAGE_NAME = $(MASTER_PACKAGE_NAME)-$(MAJOR_VERSION)
export PACKAGE_VERSION_PIN = $(MAJOR_VERSION).x

export PACKAGE_TYPES_DISABLED = apk
export PACKAGE_ARCHS_DISABLED = arm64

# This version is past end-of-life and will no longer be updated
export AUTO_UPDATE_ENABLED = false

include ../../tasks/Makefile.vendor_includes

# Approx July 1, 2024, Download URL changed from
# from https://get.gravitational.com/teleport/$(PACKAGE_VERSION)/teleport-v$(PACKAGE_VERSION)-$(OS)-$(ARCH)-bin.tar.gz
# to   https://cdn.teleport.dev/teleport-v$(PACKAGE_VERSION)-$(OS)-$(ARCH)-bin.tar.gz
export DOWNLOAD_URL = https://cdn.teleport.dev/teleport-v$(PACKAGE_VERSION)-$(OS)-$(ARCH)-bin.tar.gz
export PACKAGE_EXE = teleport tctl tsh
export INSTALL_DIR = /usr/share/${MASTER_PACKAGE_NAME}/${MAJOR_VERSION}/bin

install:
	cd $(INSTALL_PATH) && $(CURL) -o - $(DOWNLOAD_URL) | tar --strip-components=1 -zvx $(addprefix teleport/,$(PACKAGE_EXE))

test:
	pinned-package-sanity-check "$(PACKAGE_VERSION)" "$(MAJOR_VERSION)"
	teleport version | grep -F $(PACKAGE_VERSION)
	tsh version | grep -F $(PACKAGE_VERSION)
	tctl version | grep -F $(PACKAGE_VERSION)

package/prepare::
	@echo "make package/prepare ($(PACKAGE_EXE))"
	mv src/teleport src/dist
	echo $(PACKAGE_EXE) | tr ' ' '\n' | xargs -t -I{} -n1 mv -f src/dist/{} src/
