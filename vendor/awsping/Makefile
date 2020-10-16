include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk
include ../../tasks/Makefile.deb

# Package details
export VENDOR ?= ekalinin
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_NAME).$(OS).$(ARCH).tgz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(CURL) -o - $(DOWNLOAD_URL) | tar --wildcards -zxO awsping > $(INSTALL_PATH)/awsping
	chmod +x $(INSTALL_PATH)/awsping

test:
	$(PACKAGE_EXE) -v | grep $(PACKAGE_VERSION)

package/prepare::
	mv src/awsping_v$(PACKAGE_VERSION)_$(OS)_$(ARCH)/$(PACKAGE_EXE) src
