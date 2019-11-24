## Installer for non-github binary
include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package name defaults to the current working directory name
export PACKAGE_NAME = {{ .Env.APP }}
export VENDOR = {{ .Env.VENDOR }}
export DOWNLOAD_URL = {{ .Env.URL }}
export APK_BUILD_TEMPLATE = APKBUILD.github-binary

## Package specific install code
install:
	mkdir -p $(TMP)/{{ .Env.APP }}
	$(CURL) -o - $(DOWNLOAD_URL) | tar -C $(TMP)/{{ .Env.APP }} -zx $(OS)-$(ARCH)/{{ .Env.APP }}
	mv $(TMP)/{{ .Env.APP }}/$(OS)-$(ARCH)/{{ .Env.APP }} $(INSTALL_PATH)/{{ .Env.APP }}
	rm -rf $(TMP)/{{ .Env.APP }}
	chmod +x $(INSTALL_PATH)/{{ .Env.APP }}

## Always include a test, this is custom per deployment and typically is just a version check
test:
	($(PACKAGE_EXE) || true) 2>&1 | grep version

# Custom post-package processing (Note the double colon to append to current inherited package/prepare task)
#package/prepare::
#	mv src/$(OS)-$(ARCH)/helm src
