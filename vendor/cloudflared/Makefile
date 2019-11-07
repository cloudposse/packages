include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
export VENDOR ?= cloudflare
export PACKAGE_HOMEPAGE_URL = https://developers.cloudflare.com/argo-tunnel/downloads/
export DOWNLOAD_URL ?= https://bin.equinox.io/c/VdrWdbjqyF/$(PACKAGE_NAME)-stable-$(OS)-$(ARCH).tgz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat
export AUTO_UPDATE_ENABLED = false

# Releases: https://developers.cloudflare.com/argo-tunnel/downloads/
## Install cloudflared which offers an easy way to expose web servers securely to the internet(Argo Tunnel)
install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --version

