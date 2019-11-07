include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

CURRENT_VERSION: QUERY=first(.[] | .name)
CURRENT_VERSION: API=tags

# Package details
export VENDOR ?= koalaman
export DOWNLOAD_URL ?= https://storage.googleapis.com/shellcheck/shellcheck-v$(PACKAGE_VERSION).$(OS).x86_64.tar.xz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(call download_tar_xz)

test:
	$(PACKAGE_EXE) --version

package/prepare::
	mv src/shellcheck-v$(PACKAGE_VERSION)/shellcheck src
