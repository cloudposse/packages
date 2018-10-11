include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
export VENDOR ?= koalaman
export DOWNLOAD_URL ?= https://storage.googleapis.com/shellcheck/shellcheck-v$(VERSION).$(OS).x86_64.tar.xz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(call download_tarball)

test:
	$(EXE) --version

package/prepare:
	mv src/shellcheck-v$(VERSION)/shellcheck src