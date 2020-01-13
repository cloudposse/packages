## {{ .Env.APP }}
include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

## Package details 
export VENDOR = {{ .Env.VENDOR }}
export PACKAGE_NAME = {{ .Env.APP }}
export PACKAGE_REPO_NAME = {{ .Env.APP }}
export DOWNLOAD_URL = {{ .Env.URL }}

## APK build specific requirements
export APK_BUILD_TEMPLATE = APKBUILD.github-binary

## Uncomment only if you need additional libraries
#export APKBUILD_DEPENDS += libc6-compat musl

install:
	mkdir -p $(TMP)/{{ .Env.APP }}
	$(CURL) -o - $(DOWNLOAD_URL) | tar -C $(TMP)/{{ .Env.APP }} -zx $(OS)-$(ARCH)/{{ .Env.APP }}
	mv $(TMP)/{{ .Env.APP }}/$(OS)-$(ARCH)/{{ .Env.APP }} $(INSTALL_PATH)/{{ .Env.APP }}
	rm -rf $(TMP)/{{ .Env.APP }}
	chmod +x $(INSTALL_PATH)/{{ .Env.APP }}

## Always include a test, this is custom per deployment and typically is just a version check
test:
	($(PACKAGE_EXE) || true) 2>&1 | grep version

## Custom post-package processing (Note the double colon to append to current inherited package/prepare task)
# This may be required for apk building
#package/prepare::
#	mv src/{{ .Env.APP }}-$(OS).$(ARCH)/{{ .Env.APP }} src
