include ../../tasks/Makefile.vendor_includes

ifeq ($(OS), darwin)
  OS=Darwin
else ifeq ($(OS), linux)
  OS=Linux
  ifeq ($(ARCH), arm64)
    ARCH=aarch64
  endif
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
