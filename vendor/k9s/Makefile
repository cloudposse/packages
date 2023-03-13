include ../../tasks/Makefile.vendor_includes

# ARCH substitution no longer needed as of v0.27.0
#ifeq ($(ARCH), amd64)
#	ARCH=x86_64
#endif

ifeq ($(OS), darwin)
  OS=Darwin
else
  OS=Linux
endif

export VENDOR = derailed
export PACKAGE_NAME = k9s
export PACKAGE_REPO_NAME = k9s
# https://github.com/derailed/k9s/releases/download/v0.24.10/k9s_v0.24.10_Linux_x86_64.tar.gz
# https://github.com/derailed/k9s/releases/download/v0.24.15/k9s_Linux_x86_64.tar.gz
# https://github.com/derailed/k9s/releases/download/v0.27.0/k9s_Linux_amd64.tar.gz
export DOWNLOAD_URL = $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(OS)_$(ARCH).tar.gz

## APK build specific requirements
export APK_BUILD_TEMPLATE = APKBUILD.github-binary

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) version
