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

# Package details
export VENDOR ?= gravitational
export DOWNLOAD_URL ?= https://get.gravitational.com/teleport/$(PACKAGE_VERSION)/teleport-v$(PACKAGE_VERSION)-$(OS)-$(ARCH)-bin.tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat musl eudev-dev
export PACKAGE_EXE = teleport tctl tsh

install:
	$(CURL) -o - $(DOWNLOAD_URL) | tar --wildcards -zxO $(addprefix teleport/,$(PACKAGE_EXE)) > $(INSTALL_PATH)/$(PACKAGE_NAME) && chmod +x $(INSTALL_PATH)/$(PACKAGE_NAME)

test:
	teleport version
	tsh version
	tctl version

package/prepare::
	@echo "make package/prepare ($(PACKAGE_EXE))"
	mv src/teleport src/dist
	echo $(PACKAGE_EXE) | tr ' ' '\n' | xargs -t -I{} -n1 mv -f src/dist/{} src/
