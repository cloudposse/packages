include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
export VENDOR ?= alecthomas
export DOWNLOAD_URL ?= $(REPO_URL)/releases/download/v$(VERSION)/$(NAME)-$(VERSION)-$(OS)-$(ARCH).tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(call download_tarball)

test:
	$(EXE) --version

package/prepare::
	mv src/$(NAME)-$(VERSION)-$(OS)-$(ARCH)/$(NAME) src