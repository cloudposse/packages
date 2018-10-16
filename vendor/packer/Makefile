include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
export VENDOR ?= hashicorp
export DOWNLOAD_URL ?= https://releases.hashicorp.com/$(NAME)/$(VERSION)/$(NAME)_$(VERSION)_$(OS)_$(ARCH).zip
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(CURL) -o - $(DOWNLOAD_URL) > $(INSTALL_PATH)/$(NAME).zip
	unzip -p $(INSTALL_PATH)/$(NAME).zip $(NAME) > $(INSTALL_PATH)/$(NAME)
	rm $(INSTALL_PATH)/$(NAME).zip
	chmod +x $(INSTALL_PATH)/$(NAME)

test:
	$(EXE) --version
