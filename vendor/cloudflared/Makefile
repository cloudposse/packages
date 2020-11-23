include ../../tasks/Makefile.vendor_includes

# Package details
export VENDOR ?= cloudflare
export PACKAGE_HOMEPAGE_URL = https://developers.cloudflare.com/argo-tunnel/downloads/
# The latest binary is available at this URL, but is not versioned
# export DOWNLOAD_URL ?= https://bin.equinox.io/c/VdrWdbjqyF/$(PACKAGE_NAME)-stable-$(OS)-$(ARCH).tgz
# The binary is also available from GitHub, but the packaging is not consistent there
export DOWNLOAD_URL ?= https://github.com/cloudflare/$(PACKAGE_NAME)/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_NAME)-$(OS)-$(ARCH)
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat

# Cloudflare publishes their own deb and RPM packages, we do not need to
export PACKAGE_TYPES_DISABLED = deb rpm

# Releases: https://developers.cloudflare.com/argo-tunnel/downloads/
## Install cloudflared which offers an easy way to expose web servers securely to the internet(Argo Tunnel)
install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) --version | grep -F $(PACKAGE_VERSION)

