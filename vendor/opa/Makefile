export VENDOR = open-policy-agent
export PACKAGE_NAME = opa
export PACKAGE_REPO_NAME = opa

include ../../tasks/Makefile.vendor_includes

ifeq ($(OS), darwin)
  OS=darwin
else
  OS=linux
endif


# https://github.com/open-policy-agent/opa/releases/download/v0.29.4/opa_darwin_amd64
# For Alpine only, https://github.com/open-policy-agent/opa/releases/download/v0.29.4/opa_linux_amd64_static
export STATIC = $(if $(subst alpine,,$(DIST_DISTRIBUTION)),,_static)
export DOWNLOAD_URL = $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(OS)_$(ARCH)$(STATIC)

## APK build specific requirements
export APK_BUILD_TEMPLATE = APKBUILD.github-binary

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) version
