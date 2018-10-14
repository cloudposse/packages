include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
export VENDOR ?= barnybug
export DOWNLOAD_URL ?= $(REPO_URL)/releases/download/$(VERSION)/$(NAME)-$(OS)-$(ARCH)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
    ifeq ($(OS), darwin)
	  $(eval OS := mac)
    endif
	$(call download_binary)

test:
	$(EXE) --version
