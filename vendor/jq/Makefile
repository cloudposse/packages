## jq
include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

ifeq ($(OS), darwin)
  OS=osx-amd64
else
  OS=linux64
endif

export VENDOR = stedolan
export PACKAGE_NAME = jq
export PACKAGE_REPO_NAME = jq
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/$(PACKAGE_NAME)-$(PACKAGE_VERSION)/$(PACKAGE_NAME)-$(OS)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) --version
