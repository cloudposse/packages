export VENDOR = open-policy-agent
export PACKAGE_NAME = opa
export PACKAGE_REPO_NAME = opa

include ../../tasks/Makefile.vendor_includes

ifeq ($(OS), darwin)
  OS=darwin
else
  OS=linux
endif

# https://github.com/open-policy-agent/opa/releases/download/v0.29.1/opa_darwin_amd64
export DOWNLOAD_URL = $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(OS)_$(ARCH)
export APKBUILD_DEPENDS += libc6-compat musl

## APK build specific requirements
export APK_BUILD_TEMPLATE = APKBUILD.github-binary

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) version
