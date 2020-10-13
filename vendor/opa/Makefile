include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

ifeq ($(OS), darwin)
  OS=darwin
else
  OS=linux
endif

export VENDOR = open-policy-agent
export PACKAGE_NAME = opa
export PACKAGE_REPO_NAME = opa
export DOWNLOAD_URL = $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(OS)_$(ARCH)

## APK build specific requirements
export APK_BUILD_TEMPLATE = APKBUILD.github-binary

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) version
