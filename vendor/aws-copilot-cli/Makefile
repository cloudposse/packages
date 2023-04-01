# Package details
export VENDOR ?= aws
export PACKAGE_EXE = copilot
export PACKAGE_REPO_NAME ?= copilot-cli
# https://github.com/aws/copilot-cli/releases/download/v1.27.0/copilot-linux-arm64-v1.27.0
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_EXE)-$(OS)-$(ARCH)-v$(PACKAGE_VERSION)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

include ../../tasks/Makefile.vendor_includes

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) --version | grep -F $(PACKAGE_VERSION)
