# Package details
export VENDOR ?= kubernetes-sigs
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export DOWNLOAD_URL ?= $(REPO_URL)/releases/download/v$(VERSION)/heptio-authenticator-aws_$(VERSION)_$(OS)_$(ARCH)

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

install:
	$(call download_binary)

package/prepare::
	@echo "make package/prepare ($(EXE))"
	mv src/heptio-authenticator-aws* src/$(EXE)

test:
	$(EXE) --help
