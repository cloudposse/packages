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
# Need static for Red Hat Universal Base Image 8 (Centos) as well starting with version 0.39.0,
# might as well just always use the static version.
#export STATIC = $(if $(subst alpine,,$(DIST_DISTRIBUTION)),,_static)
#export DOWNLOAD_URL = $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(OS)_$(ARCH)$(STATIC)
export DOWNLOAD_URL = $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(OS)_$(ARCH)_static

## APK build specific requirements
export APK_BUILD_TEMPLATE = APKBUILD.github-binary

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) version
