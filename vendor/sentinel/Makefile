## Package - sentinel

## Sentinel is not an open source, so we don't want to distribute it
export PACKAGE_ENABLED = false

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

export VENDOR ?= hashicorp
export PACKAGE_NAME ?= sentinel
export DOWNLOAD_URL ?= https://releases.hashicorp.com/$(PACKAGE_NAME)/$(PACKAGE_VERSION)/$(PACKAGE_NAME)_$(PACKAGE_VERSION)_$(OS)_$(ARCH).zip
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

CURRENT_VERSION:
	@local_version=$$(cat VERSION || echo 0); \
	current_version=$$(curl -s "https://releases.hashicorp.com/$(PACKAGE_NAME)/" | sed -nE 's/.*\<a\shref=\"\/sentinel\/(\d+\.\d+\.\d+)\/.*/\1/pi' | head -n 1); \
	if [ $$? -ne 0 ]; then \
		exit 1; \
	elif [ "$${current_version}" == "null" -o -z "$${current_version}" ]; then \
		echo "ERROR: failed to obtain current version for $(VENDOR)/$(PACKAGE_REPO_NAME) (got: $${current_version})"; \
		exit 1; \
	elif [ "$${local_version}" != "$${current_version}" ]; then \
		echo "Upgrading $(PACKAGE_NAME) from $${local_version} to $${current_version}"; \
		echo "$${current_version}" > VERSION; \
	fi

install:
	$(call download_zip)

test:
	$(PACKAGE_EXE) version
