# Package details
export VENDOR ?= aws
export PACKAGE_EXE = ec2-instance-selector
export PACKAGE_REPO_NAME ?= amazon-ec2-instance-selector
# https://github.com/aws/amazon-ec2-instance-selector/releases/download/v2.0.2/ec2-instance-selector-darwin-amd64
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_EXE)-$(OS)-$(ARCH)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

include ../../tasks/Makefile.vendor_includes

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) --version | grep -F $(PACKAGE_VERSION)
