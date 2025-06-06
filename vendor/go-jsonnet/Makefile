export VENDOR ?= google
export PACKAGE_REPO_NAME ?= go-jsonnet
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export PACKAGE_EXE ?= jsonnet

include ../../tasks/Makefile.vendor_includes

ifeq ($(ARCH), amd64)
	DL_ARCH=x86_64
else
	DL_ARCH=$(ARCH)
endif

ifeq ($(OS), darwin)
  OS=Darwin
else
  OS=Linux
endif

export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(OS)_$(DL_ARCH).tar.gz

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --version
