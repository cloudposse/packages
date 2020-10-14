include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

ifeq ($(ARCH), amd64)
	ARCH=x86_64
endif

ifeq ($(OS), darwin)
  OS=Darwin
else
  OS=Linux
endif

export VENDOR = open-policy-agent
export PACKAGE_NAME = conftest
export PACKAGE_REPO_NAME = conftest
export DOWNLOAD_URL = $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_${PACKAGE_VERSION}_$(OS)_$(ARCH).tar.gz

## APK build specific requirements
export APK_BUILD_TEMPLATE = APKBUILD.github-binary

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --version
