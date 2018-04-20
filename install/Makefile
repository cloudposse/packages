ARCH ?= amd64
OS ?= $(shell uname -s | tr '[:upper:]' '[:lower:'])
INSTALL_PATH ?= /usr/local/bin
CURL ?= curl --fail -sSL

# Macro to download a github binary release
# $(call github_download_binary_release,version,repo,asset)
github_download_binary_release = $(CURL) -o $(INSTALL_PATH)/$@ https://github.com/$(1)/$@/releases/download/$(2)/$(3) && chmod +x $(INSTALL_PATH)/$@

all: aws-vault chamber github-commenter gomplate

export AWS_VAULT_VERSION ?= 4.2.0
## Install aws-vault to easily assume roles (not related to HashiCorp Vault)
aws-vault:
	$(call github_download_binary_release,99designs,v$(AWS_VAULT_VERSION),$@-$(OS)-$(ARCH))

export CHAMBER_VERSION ?= 2.0.0
## Install Chamber to manage secrets with SSM+KMS
chamber:
	$(call github_download_binary_release,segmentio,v$(CHAMBER_VERSION),$@-v$(CHAMBER_VERSION)-$(OS)-$(ARCH))

export GITHUB_COMMENTER_VERSION ?= 0.1.0
## Install github-commenter
github-commenter:
	$(call github_download_binary_release,cloudposse,$(GITHUB_COMMENTER_VERSION),$@_$(OS)_$(ARCH))

export GOMPLATE_VERSION ?= 2.4.0
## Install gomplate
gomplate:
	$(call github_download_binary_release,hairyhenderson,v$(GOMPLATE_VERSION),$@_$(OS)-$(ARCH)-slim)
