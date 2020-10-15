include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk
include ../../tasks/Makefile.deb

export VENDOR = argoproj
export PACKAGE_NAME = argocd
export PACKAGE_REPO_NAME = argo-cd
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)-$(OS)-$(ARCH)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat musl

install:
	$(call download_binary)

test:
	($(PACKAGE_NAME) version || true) 2>&1 | grep 'server address unspecified'
