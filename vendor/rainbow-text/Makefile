## Package - rainbow
# Example for GO package based on GO library.
# Note that you must update main.go to call the library
# and optionally add options and help.
export VENDOR = arsham
export PACKAGE_NAME = rainbow-text
export PACKAGE_EXE = rainbow
export PACKAGE_REPO_NAME = rainbow
export DOWNLOAD_URL ?= $(PACKAGE_EXE)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APK_PACKAGE_VERSION := $(shell cat VERSION | sed s/\+.*//)
export INSTALL_PATH=/usr/local/bin

# Ensure binary is statically linked
export CGO_ENABLED = 0

# RPM should be relatively easy, but we will get to it later
export PACKAGE_TYPES_DISABLED = rpm

# Custom auto-update target
export PACKAGE_VERSION_TARGET := GOLANG_LATEST_VERSION

include ../../tasks/Makefile.vendor_includes

version.go: VERSION
	go generate

# Cannot depend on file modification dates to regenerate version because builder uses fresh git clone
$(INSTALL_PATH)/$(PACKAGE_EXE): main.go version.go VERSION
	go generate
	mkdir -p $(INSTALL_PATH)
	go build -buildvcs=false -o $(INSTALL_PATH)/$(PACKAGE_EXE)

test:
	@printf '%s\n' 'TESTING binary by executing >>>: $(PACKAGE_EXE) --version | grep -F $(PACKAGE_VERSION)'
	$(PACKAGE_EXE) --version | grep -F $(PACKAGE_VERSION)

## This may be required for apk building and varies from package to package
# Custom post-package processing (Note the double colon to append to current inherited package/prepare task)
#package/prepare::
# 	echo cp src/gh_$(PACKAGE_VERSION)_$(OS)_$(ARCH)/bin/$(PACKAGE_EXE) src

apk/prepare:: $(INSTALL_PATH)/$(PACKAGE_EXE)
	cp -p $(INSTALL_PATH)/$(PACKAGE_EXE) $(APK_TMP_DIR)
	chown nobody $(APK_TMP_DIR)/$(PACKAGE_EXE)

install: $(INSTALL_PATH)/$(PACKAGE_EXE)
