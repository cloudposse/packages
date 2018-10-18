include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
export VENDOR ?= bats-core
export DOWNLOAD_URL ?= $(REPO_URL)/archive/v$(VERSION).tar.gz
export APK_BUILD_TEMPLATE ?= AP KBUILD.github-binary

install: 
	curl --fail -sSL -O $(DOWNLOAD_URL) && \
  tar -C /tmp -zxf v$(VERSION).tar.gz && \
  /tmp/bats-core-$(VERSION)/install.sh /usr/local && \
  rm -rf v$(VERSION).tar.gz && \
  rm -rf /tmp/bats-core-$(VERSION)

test:
	$(EXE) version