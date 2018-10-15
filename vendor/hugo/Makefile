include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

ifeq ($(OS), darwin)
  $(eval OS := macOS)
else
  $(eval OS := Linux)
endif

# Package details
export VENDOR ?= gohugoio
export DOWNLOAD_URL ?= $(REPO_URL)/releases/download/v$(VERSION)/$(NAME)_$(VERSION)_$(OS)-64bit.tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(call download_tarball)

test:
	$(EXE) version
