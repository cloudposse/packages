## {{ .Env.APP }}
include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

export VENDOR = {{ .Env.VENDOR }}
export PACKAGE_NAME = {{ .Env.APP }}
export PACKAGE_REPO_NAME = {{ .Env.REPO }}
export DOWNLOAD_URL ?= {{ .Env.URL }}
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

## Uncomment only if you need additional libraries
#export APKBUILD_DEPENDS += libc6-compat musl

install:
	$(call download_binary)

test:
	$(PACKAGE_EXE) --version

## This may be required for apk building and varies from package to package
# Custom post-package processing (Note the double colon to append to current inherited package/prepare task)
#package/prepare::
#	mv src/{{ .Env.APP }}-$(OS).$(ARCH)/{{ .Env.APP }} src
