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

# Prevent build errors because of different versions of go in different workflows
export GOTOOLCHAIN := local

version.go: VERSION
	go generate

# Cannot depend on file modification dates to regenerate version because builder uses fresh git clone
$(INSTALL_PATH)/$(PACKAGE_EXE): main.go version.go VERSION
	go generate
	mkdir -p $(INSTALL_PATH)
	go build -buildvcs=false -o $(INSTALL_PATH)/$(PACKAGE_EXE)

test:
	@echo Test: expecting exe version like $(APK_PACKAGE_VERSION) or $(DEB_PACKAGE_VERSION) from VERSION $(shell cat VERSION)
	@echo Running: $(PACKAGE_EXE) --version && $(PACKAGE_EXE) --version
	$(PACKAGE_EXE) --version | grep -q -F $(APK_PACKAGE_VERSION)

## This may be required for apk building and varies from package to package
# Custom post-package processing (Note the double colon to append to current inherited package/prepare task)
#package/prepare::
# 	echo cp src/gh_$(PACKAGE_VERSION)_$(OS)_$(ARCH)/bin/$(PACKAGE_EXE) src

apk/prepare:: $(INSTALL_PATH)/$(PACKAGE_EXE)
	cp -p $(INSTALL_PATH)/$(PACKAGE_EXE) $(APK_TMP_DIR)
	chown nobody $(APK_TMP_DIR)/$(PACKAGE_EXE)

install: $(INSTALL_PATH)/$(PACKAGE_EXE)

go-update:
	go get -u github.com/hashicorp/terraform-config-inspect
	printf "%s" $$(grep -F github.com/hashicorp/terraform-config-inspect go.mod| sed -e 's/.* v//' -e 's/\.0-/./' -e 's/-/+git/') > VERSION
