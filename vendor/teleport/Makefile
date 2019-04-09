include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
export VENDOR ?= gravitational
export DOWNLOAD_URL ?= https://get.gravitational.com/teleport/$(PACKAGE_VERSION)/teleport-v$(PACKAGE_VERSION)-$(OS)-$(ARCH)-bin.tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat musl
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
