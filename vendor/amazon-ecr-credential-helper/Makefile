# Package details
export VENDOR ?= awslabs
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export DOWNLOAD_URL ?= https://amazon-ecr-credential-helper-releases.s3.us-east-2.amazonaws.com/$(PACKAGE_VERSION)/$(HOST_OS)-$(ARCH)/docker-credential-ecr-login
export CHECK_COMMAND_ARGUMENTS ?= version
export CHECK_COMMAND_ENV ?= HOME=./
export PACKAGE_NAME ?= docker-credential-ecr-login

include ../../tasks/Makefile.vendor_includes

install:
	$(call download_binary)

test:
	HOME=/tmp $(PACKAGE_EXE) -v | grep -F $(PACKAGE_VERSION)
