export VENDOR ?= google
export PACKAGE_REPO_NAME ?= go-jsonnet
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export PACKAGE_EXE ?= jsonnet

include ../../tasks/Makefile.vendor_includes


export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_Linux_x86_64.tar.gz

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --version
