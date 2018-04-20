ARCH ?= amd64
OS ?= $(shell uname -s | tr '[:upper:]' '[:lower:'])
INSTALL_PATH ?= /usr/local/bin
CURL ?= curl --fail -sSL
TMP ?= /tmp

# Macro to download a github binary release
# $(call github_download_binary_release,version,repo,asset)
github_download_binary_release = $(CURL) -o $(INSTALL_PATH)/$@ https://github.com/$(1)/$@/releases/download/$(2)/$(3) && chmod +x $(INSTALL_PATH)/$@

all: aws-vault \
	 chamber \
	 github-commenter \
	 gomplate \
	 goofys \
	 helm \
	 helmfile \
	 kops \
	 kubectl \
	 sops \
	 terraform

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

export GOOFYS_VERSION ?= 0.19.0
## Install goofys
goofys:
	$(call github_download_binary_release,kahing,v$(GOOFYS_VERSION),$@)

export HELM_VERSION ?= 2.8.2
## Install helm
helm:
	mkdir -p $(TMP)/$@
	$(CURL) -o - http://storage.googleapis.com/kubernetes-helm/helm-v${HELM_VERSION}-$(OS)-$(ARCH).tar.gz | tar -C $(TMP)/$@ -zx $(OS)-$(ARCH)/helm
	mv $(TMP)/$@/$(OS)-$(ARCH)/helm $(INSTALL_PATH)/$@
	rm -rf $(TMP)/$@
	chmod +x $(INSTALL_PATH)/helm

export HELMFILE_VERSION ?= 0.11
## Install helmfile
helmfile:
	$(call github_download_binary_release,roboll,v$(HELMFILE_VERSION),$@_$(OS)_$(ARCH))

export KOPS_VERSION ?= 1.8.0
## Install kops
kops:
	$(call github_download_binary_release,kubernetes,v$(KOPS_VERSION),$@-$(OS)-$(ARCH))

## Install kubectl
export KUBECTL_VERSION ?= 1.8.7
kubectl:
	$(CURL) -o $(INSTALL_PATH)/$@ https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/$(OS)/$(ARCH)/kubectl
	chmod +x $(INSTALL_PATH)/$@

export TERRAFORM_VERSION ?= 0.11.5
## Install Terraform
terraform:
	mkdir -p $(TMP)/$@
	$(CURL) -o $(TMP)/$@/terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_$(OS)_$(ARCH).zip
	unzip -d $(TMP)/$@ $(TMP)/$@/terraform.zip
	mv $(TMP)/$@/terraform $(INSTALL_PATH)/$@
	chmod +x $(INSTALL_PATH)/$@

export SOPS_VERSION ?= 3.0.3
## Install sops (required by `helm-secrets`)
sops:
	$(call github_download_binary_release,mozilla,$(SOPS_VERSION),$@-$(SOPS_VERSION).$(OS))


.PHONY : help
help:
	@printf "Available targets:\n\n"
	@awk '/^[a-zA-Z\-\_0-9%:\\\/]+:/ { \
	  helpMessage = match(lastLine, /^## (.*)/); \
	  if (helpMessage) { \
	    helpCommand = $$1; \
	    helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
      gsub("\\\\", "", helpCommand); \
      gsub(":+$$", "", helpCommand); \
	    printf "  \x1b[32;01m%-35s\x1b[0m %s\n", helpCommand, helpMessage; \
	  } \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST) | sort -u
	@printf "\n"
