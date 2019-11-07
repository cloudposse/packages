include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
export VENDOR ?= segmentio
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)-v$(PACKAGE_VERSION)-$(OS)-$(ARCH)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat
export PACKAGE_DESCRIPTION = aws-okta allows users to authenticate with AWS using Okta credentials

# Disable automatic updates until this is fixed: https://github.com/segmentio/aws-okta/issues/246
export AUTO_UPDATE_ENABLED = false

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) help
