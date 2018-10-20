# Package details
export VENDOR ?= bats-core
export DOWNLOAD_URL ?= bats-core.tar.gz::$(REPO_URL)/archive/v$(VERSION).tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export NAME ?= bats

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk
export APKBUILD_DEPENDS += bash


install: 
	$(CURL) -O $(REPO_URL)/archive/v$(VERSION).tar.gz
	tar -C /tmp -zxf v$(VERSION).tar.gz 
	/tmp/bats-core-$(VERSION)/install.sh /usr/local
	rm -rf v$(VERSION).tar.gz
	rm -rf /tmp/bats-core-$(VERSION)

test:
	$(EXE) --version

package/prepare::
	src/bats-core-$(VERSION)/install.sh src
	mv src/bin/bats src