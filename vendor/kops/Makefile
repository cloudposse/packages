include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
export VENDOR ?= kubernetes
export DOWNLOAD_URL ?= $(REPO_URL)/releases/download/$(VERSION)/$(NAME)-$(OS)-$(ARCH)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
#export APKBUILD_DEPENDS += libc6-compat

install:
	$(call download_binary)

test:
	$(EXE) version
