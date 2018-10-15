include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
export VENDOR ?= sahsanu
export DOWNLOAD_URL ?= https://raw.githubusercontent.com/sahsanu/lectl/v$(VERSION)/lectl
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += util-linux bash
export OS_ARCH = noarch

install:
	$(call download_binary)

test:
	$(EXE) --version
