# Package details
export VENDOR ?= kubernetes-sigs
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/aws-iam-authenticator$(PACKAGE_VERSION)_$(OS)_$(ARCH)

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

install:
	$(call download_binary)

package/prepare::
	@echo "make package/prepare ($(PACKAGE_EXE))"
	mv src/heptio-authenticator-aws* src/$(PACKAGE_EXE)

test:
	$(PACKAGE_EXE) --help
