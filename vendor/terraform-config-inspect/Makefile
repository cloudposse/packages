## Package - terraform-config-inspect
export VENDOR = hashicorp
export PACKAGE_NAME = terraform-config-inspect
export DOWNLOAD_URL ?= $(PACKAGE_EXE)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APK_PACKAGE_VERSION := $(shell cat VERSION | sed s/\+.*//)
export INSTALL_PATH=/usr/local/bin

# RPM should be relatively easy, but we will get to it later
export PACKAGE_TYPES_DISABLED = rpm

# Custom auto-update target
export PACKAGE_VERSION_TARGET := go-update

include ../../tasks/Makefile.vendor_includes

version.go: VERSION
	go generate

$(INSTALL_PATH)/$(PACKAGE_EXE): main.go version.go VERSION
	chmod 777 ../../tmp || echo Failed to chmod ../../tmp from $(shell pwd -P)
	mkdir -p $(INSTALL_PATH)
	go build -o $(INSTALL_PATH)/$(PACKAGE_EXE)

test:
	@echo Test: expecting exe version like $(APK_PACKAGE_VERSION) or $(DEB_PACKAGE_VERSION) from VERSION $(shell cat VERSION)
	@echo Running: $(PACKAGE_EXE) --version && $(PACKAGE_EXE) --version
	$(PACKAGE_EXE) --version | grep -q -F $(APK_PACKAGE_VERSION)

## This may be required for apk building and varies from package to package
# Custom post-package processing (Note the double colon to append to current inherited package/prepare task)
# 	echo cp src/gh_$(PACKAGE_VERSION)_$(OS)_$(ARCH)/bin/$(PACKAGE_EXE) src
package/prepare::
	echo CUSTOM PREPARE
	echo cwd is $$(pwd)
	echo APK_TMP_DIR is $(APK_TMP_DIR)
	echo ls -l $(APK_TMP_DIR)/../..
	ls -l $(APK_TMP_DIR)/../..
	echo ls -l ../../
	ls -l ../../
	chmod 777 ../../tmp || echo could not chmod ../../tmp

apk/prepare:: $(INSTALL_PATH)/$(PACKAGE_EXE)
	cp -p $(INSTALL_PATH)/$(PACKAGE_EXE) $(APK_TMP_DIR)

install: $(INSTALL_PATH)/$(PACKAGE_EXE)

go-update:
	go get -u github.com/hashicorp/terraform-config-inspect
	printf "%s" $$(grep -F github.com/hashicorp/terraform-config-inspect go.mod| sed -e 's/.* v//' -e 's/\.0-/./' -e 's/-/+git/') > VERSION
