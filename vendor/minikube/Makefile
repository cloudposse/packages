## Package - minikube

export VENDOR = kubernetes
export PACKAGE_NAME = minikube
export PACKAGE_REPO_NAME = minikube
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/$(PACKAGE_NAME)-$(OS)-$(ARCH)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

# As of v1.30.0, the minikube release asset for linux/amd64 does not run on Alpine.
# See https://github.com/kubernetes/minikube/issues/16228
export PACKAGE_TYPES_DISABLED = apk

include ../../tasks/Makefile.vendor_includes

## Uncomment only if you need additional libraries
# May need gcompat rather than libc6-compat for minikube and other go v1.20 binaries,
# but for now (2023-04-04), neither work.
export APKBUILD_DEPENDS += libc6-compat

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) version
