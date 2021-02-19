include ../../tasks/Makefile.vendor_includes

# Package details
export VENDOR ?= ztombol
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/archive/v$(PACKAGE_VERSION).tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export INSTALL_PATH ?= /usr/local/lib/bats
export APKBUILD_DEPENDS += bats

install:
	[ -n "$(TMP)" ] && [ -n "$(PACKAGE_NAME)" ] && rm -rf "$(TMP)/$(PACKAGE_NAME)"
	mkdir -p $(TMP)/$(PACKAGE_NAME)
	$(CURL) -o - $(DOWNLOAD_URL) | tar -zx -C $(TMP)/$(PACKAGE_NAME)
	mv $(TMP)/$(PACKAGE_NAME)/$(PACKAGE_NAME)-$(PACKAGE_VERSION)/* $(TMP)/$(PACKAGE_NAME)/
	rm -rf $(TMP)/$(PACKAGE_NAME)/$(PACKAGE_NAME)-$(PACKAGE_VERSION)
	cp -R $(TMP)/$(PACKAGE_NAME) $(INSTALL_PATH)/$(PACKAGE_NAME)
	mkdir -p /usr/local/lib/bats
	touch /usr/local/lib/bats/load.bash
	printf 'source "%s"\n' "$(INSTALL_PATH)/$(PACKAGE_NAME)/load.bash" >> /usr/local/lib/bats/load.bash
	[ -n "$(TMP)" ] && [ -n "$(PACKAGE_NAME)" ] && rm -rf "$(TMP)/$(PACKAGE_NAME)"

test:
	ls -l $(INSTALL_PATH)/$(PACKAGE_NAME)/load.bash && grep -q "$(INSTALL_PATH)/$(PACKAGE_NAME)/load.bash" /usr/local/lib/bats/load.bash
