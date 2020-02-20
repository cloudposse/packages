## Package - minikube
include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

export VENDOR = kubernetes
export PACKAGE_NAME = minikube
export PACKAGE_REPO_NAME = minikube
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)-$(OS)-$(ARCH)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

## Uncomment only if you need additional libraries
export APKBUILD_DEPENDS += libc6-compat

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) version
