include ../../tasks/Makefile.vendor_includes

# Package details
# NOTE: vert is a tool used by our Make recipies and so it has to be able to be installed
# while making other packages. We cannot rely on default values of any of the variables
# because they may be set for a different package.
#
# vert is only built by the distributor for linux-amd64, but it is a very important tool,
# so we custom built it for other platforms.
export VENDOR = Masterminds
export PACKAGE_NAME = vert
export PACKAGE_EXE = vert
export PACKAGE_REPO_NAME = vert
export PACKAGE_REPO_URL = https://github.com/$(VENDOR)/$(PACKAGE_REPO_NAME)
export PACKAGE_VERSION = $(shell cat VERSION 2>/dev/null)
export DOWNLOAD_URL = $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)-v$(PACKAGE_VERSION)-linux-amd64
export APK_BUILD_TEMPLATE = APKBUILD.github-binary

ifeq ($(OS)-$(ARCH),linux-amd64)
  # We can use the official release
install:
	$(call download_binary)
else
install:
	mkdir -p -m a+rX $(INSTALL_PATH)
	cp ./bin/vert-v$(PACKAGE_VERSION)-$(OS).$(ARCH) $(INSTALL_PATH)/$(PACKAGE_EXE) && chmod +x $(INSTALL_PATH)/$(PACKAGE_EXE)
endif

test:
	$(PACKAGE_EXE) --version | grep -F $(PACKAGE_VERSION)

# To build vert for other platforms, you need old style (pre go modules) deb and GOPATH
# cd $GOPATH/src/github.com
# git clone git@github.com:Masterminds/vert.git
# cd vert
# dep ensure
# dep status
# export PACKAGE_VERSION=$(cat VERSION)
# export CGO_ENABLED=0
# export GO111MODULE=off
# export GOOS=darwin
# export GOARCH=amd64
# go build -ldflags="-s -w" -o bin/vert-v${PACKAGE_VERSION}-${GOOS}.${GOARCH}
#
# export GOARCH=arm64
# go build -ldflags="-s -w" -o bin/vert-v${PACKAGE_VERSION}-${GOOS}.${GOARCH}
#
# export GOOS=linux
# go build -ldflags="-s -w" -o bin/vert-v${PACKAGE_VERSION}-${GOOS}.${GOARCH}
