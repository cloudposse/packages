include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details (VENDOR, PACKAGE_NAME, and PACKAGE_REPO_NAME are used to construct the inherited PACKAGE_REPO_URL and PACKAGE_EXE
export VENDOR = {{ .Env.VENDOR }}
export PACKAGE_NAME = {{ .Env.APP }}
# Folder which package is extracted into
export PACKAGE_REPO_NAME = {{ .Env.APP }}

# Update as required
export DOWNLOAD_URL ?= {{ .Env.URL }}
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(call download_tarball)

test:
	$(PACKAGE_EXE) --version
