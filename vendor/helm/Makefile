include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
export VENDOR ?= helm
export DOWNLOAD_URL ?= http://storage.googleapis.com/kubernetes-helm/helm-v$(VERSION)-$(OS)-$(ARCH).tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	mkdir -p $(TMP)/$(PACKAGE_NAME)
	$(CURL) -o - $(DOWNLOAD_URL) | tar -C $(TMP)/$(PACKAGE_NAME) -zx $(OS)-$(ARCH)/helm
	mv $(TMP)/$(PACKAGE_NAME)/$(OS)-$(ARCH)/helm $(INSTALL_PATH)/$(PACKAGE_NAME)
	rm -rf $(TMP)/$(PACKAGE_NAME)
	chmod +x $(INSTALL_PATH)/helm

test:
	($(EXE) || true) 2>&1 | grep version

package/prepare::
	mv src/$(OS)-$(ARCH)/helm src
