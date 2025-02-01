export VENDOR = siderolabs
export PACKAGE_NAME = talosctl
export PACKAGE_REPO_NAME = talos

# URL: https://github.com/siderolabs/talos/releases/download/v1.9.3/talosctl-linux-amd64 
export DOWNLOAD_URL = $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)-$(OS)-$(ARCH)

## APK build specific requirements
export APK_BUILD_TEMPLATE = APKBUILD.github-binary

include ../../tasks/Makefile.vendor_includes

install:
	$(call download_binary)

test:
	printf 'TESTING binary by executing >>>: %s\n' '$(PACKAGE_EXE) version | grep -F $(PACKAGE_VERSION)'
	$(PACKAGE_EXE) version | grep -F $(PACKAGE_VERSION)
