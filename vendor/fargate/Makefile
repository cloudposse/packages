include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# Package details
export VENDOR ?= jpignata
export DOWNLOAD_URL ?= $(REPO_URL)/releases/download/v$(VERSION)/$(NAME)-$(VERSION)-$(OS)-$(ARCH).zip
export APK_BUILD_TEMPLATE ?= APKBUILD.github-binary

install:
	$(CURL) -o - $(DOWNLOAD_URL) > $(TMP)/$(NAME).zip
	unzip -p $(TMP)/$(NAME).zip $(NAME) > $(INSTALL_PATH)/$(NAME)
	rm $(TMP)/$(NAME).zip
	chmod +x $(INSTALL_PATH)/$(NAME)

test:
	$(EXE) --version

