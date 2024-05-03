## jq

# jq is now disabled because the GitHub repo did not publish arm64 binaries
# for v1.6.0 and the mainstream repos all have jq packages now.

export PACKAGE_ENABLED = false


export PACKAGE_VERSION_SEMVER_XFORM = sed -E  's/\bjq-([.0-9]+)/\1/g'

include ../../tasks/Makefile.vendor_includes

ifeq ($(OS), darwin)
  GITHUB_OS=osx-amd64
else
  GITHUB_OS=linux64
endif

GITHUB_VERSION =$(shell printf "%s" "$(PACKAGE_VERSION)" | sed -E 's/^([0-9]\.[0-9]+).*$$/\1/')


export VENDOR = stedolan
export PACKAGE_NAME = jq
export DOWNLOAD_URL = $(PACKAGE_REPO_URL)/releases/download/jq-$(GITHUB_VERSION)/$(PACKAGE_NAME)-$(GITHUB_OS)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) --version
