## jq
include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk
include ../../tasks/Makefile.deb

ifeq ($(OS), darwin)
  OS=osx-amd64
else
  OS=linux64
endif

export GITHUB_VERSION := $(shell cat VERSION)
export PACKAGE_VERSION := $(shell echo ${GITHUB_VERSION} | sed -E 's/^jq-([.0-9]+)/\1/')

export VENDOR = stedolan
export PACKAGE_NAME = jq
export DOWNLOAD_URL = $(PACKAGE_REPO_URL)/releases/download/$(GITHUB_VERSION)/$(PACKAGE_NAME)-$(OS)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) --version
