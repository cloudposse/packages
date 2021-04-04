# Package details
export VENDOR ?= jgm
export DOWNLOAD_URL ?= $(PACKAGE_REPO_URL)/releases/download/$(PACKAGE_VERSION)/$(PACKAGE_NAME)-$(PACKAGE_VERSION)-$(OS)-$(ARCH).tar.gz
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary
export APKBUILD_DEPENDS += libc6-compat

PACKAGE_VERSION_TARGET := PANDOC_RELEASE_VERSION

include ../../tasks/Makefile.vendor_includes

install:
	$(call download_tar_gz)

test:
	$(PACKAGE_EXE) -v

package/prepare::
	mv $$(find . -type f -name 'pandoc') src/

PANDOC_RELEASE_VERSION: API=releases?per_page=100
PANDOC_RELEASE_VERSION: QUERY=.[] | select(.prerelease == false or .prerelease == $(PACKAGE_PRERELEASE_ENABLED)) | .tag_name
PANDOC_RELEASE_VERSION:
	@if [ "$${AUTO_UPDATE_ENABLED:-true}" == "true" ]; then \
		local_version=$$(cat VERSION || echo 0); \
		releases=($$(env PATH='$(PATH)' github-repo-metadata $(VENDOR) $(PACKAGE_REPO_NAME) '$(API)' '$(QUERY)')); \
		current_version="$${releases[0]}"; \
		if [ $$? -ne 0 ]; then \
			exit 1; \
		elif [ "$${current_version}" == "null" -o -z "$${current_version}" ]; then \
			echo "ERROR: failed to obtain version matching '$${version_pin}' for $(VENDOR)/$(PACKAGE_REPO_NAME) (got: $${releases[@]:0:10}...)" >&2; \
			exit 1; \
		elif [ "$${local_version}" != "$${current_version}" ]; then \
			echo "Upgrading $(PACKAGE_NAME) from $${local_version} to $${current_version}"; \
			echo "$${current_version}" > VERSION; \
		fi; \
	else \
		echo "NOT \"Upgrading\" $(PACKAGE_NAME) from $${local_version} to $${current_version} because auto-update is disabled" >&2; \
	fi
