include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

ifeq ($(OS), darwin)
  OS=Darwin
else
  OS=Linux
endif

ifeq ($(ARCH), amd64)
  ARCH=x86_64
else ifeq ($(ARCH), 686)
  ARCH=i686
endif

# Package details
export VENDOR ?= getsentry
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_NAME)-$(OS)-$(ARCH)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) --help
