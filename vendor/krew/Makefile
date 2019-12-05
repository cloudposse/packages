## Package template for non-github tarball

## Package details 
export VENDOR = kubernetes-sigs
export PACKAGE_NAME = krew
export PACKAGE_REPO_NAME = krew
export DOWNLOAD_URL = $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/krew.tar.gz

## APK build specific requirements
export APK_BUILD_TEMPLATE = APKBUILD.github-binary
## Uncomment only if you need additional libraries
#export APKBUILD_DEPENDS += libc6-compat musl

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

## Package specific install code
install:
	set -x; mkdir -p $(TMP)/krew && cd $(TMP)/krew && \
	export KREW_ROOT=$(INSTALL_PATH) && \
	curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/download/v$(PACKAGE_VERSION)/krew.{tar.gz,yaml}" && \
		tar zxvf krew.tar.gz && \
		./krew-$(OS)_$(ARCH) install --manifest=krew.yaml --archive=krew.tar.gz && \
		mv ./krew-$(OS)_$(ARCH) $(INSTALL_PATH)/krew

## Always include a test, this is custom per deployment and typically is just a version check
test:
	krew version

# Custom post-package processing (Note the double colon to append to current inherited package/prepare task)
## This may be required for apk building
package/prepare::
	mv src/krew-$(OS)_$(ARCH) src/krew
