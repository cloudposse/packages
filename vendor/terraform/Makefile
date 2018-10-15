include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
export VENDOR ?= hashicorp
export DOWNLOAD_URL ?= https://releases.hashicorp.com/$(NAME)/$(VERSION)/$(NAME)_$(VERSION)_$(OS)_$(ARCH).zip 
	## Run go generate in all packages
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	mkdir -p $(TMP)/$(NAME)
	$(CURL) -o $(TMP)/$(NAME)/terraform.zip $(DOWNLOAD_URL)
	unzip -d $(TMP)/$(NAME) $(TMP)/$(NAME)/$(NAME).zip
	mv $(TMP)/$(NAME)/$(NAME) $(INSTALL_PATH)/$(NAME)
	chmod +x $(INSTALL_PATH)/$(NAME)

test:
	$(EXE) version

