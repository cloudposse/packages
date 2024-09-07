# Package details
export VENDOR ?= wrouesnel
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += ca-certificates
export PACKAGE_EXE = email

# https://github.com/wrouesnel/emailcli/releases/download/v1.1.0/emailcli_v1.1.0_linux-amd64.tar.gz
export DOWNLOAD_URL ?= https://github.com/wrouesnel/emailcli/releases/download/v$(PACKAGE_VERSION)/emailcli_v$(PACKAGE_VERSION)_$(OS)-$(ARCH).tar.gz


include ../../tasks/Makefile.vendor_includes

# Unusual: the published package is named emailcli, but the executable is email
# The recipe expect the executable in the package to have the same name as the package
install: PACKAGE_NAME = email
install:
	$(call download_tar_gz)

test:
	@echo -n "Testing $$(basename $(PACKAGE_EXE))... "
	@$(PACKAGE_EXE) test@example.com --version 2>&1 | grep -q -F $(PACKAGE_VERSION) && echo Pass || { printf "\n\nERROR: %s not found in version output '%s'\n\n" "$(PACKAGE_VERSION)" "$$($(PACKAGE_EXE) test@example.com --version)"; exit 1; }

package/prepare::
	mv src/emailcli_v$(PACKAGE_VERSION)_$(OS)-$(ARCH)/email src/email
