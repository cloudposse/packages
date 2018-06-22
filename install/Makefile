ARCH ?= amd64
OS ?= $(shell uname -s | tr '[:upper:]' '[:lower:'])
INSTALL_PATH ?= /usr/local/bin
CURL ?= curl --fail -sSL
TMP ?= /tmp

# Macro to download a github binary release
# $(call github_download_binary_release,version,repo,asset)
github_download_binary_release = [ -f $(INSTALL_PATH)/$@ ] || $(CURL) -o $(INSTALL_PATH)/$@ https://github.com/$(1)/$@/releases/download/$(2)/$(3) && chmod +x $(INSTALL_PATH)/$@

all: aws-vault \
	 chamber \
	 fetch \
	 github-commenter \
	 gomplate \
	 goofys \
	 helm \
	 helmfile \
	 htmltest \
	 kops \
	 kubectl \
	 kubectx \
	 kubens \
	 sops \
	 stern \
	 terraform \
	 terraform-docs \
	 terragrunt \
	 yq

export AWS_VAULT_VERSION ?= 4.2.0
## Install aws-vault to easily assume roles (not related to HashiCorp Vault)
aws-vault:
	$(call github_download_binary_release,99designs,v$(AWS_VAULT_VERSION),$@-$(OS)-$(ARCH))

export CHAMBER_VERSION ?= 2.0.0
## Install Chamber to manage secrets with SSM+KMS
chamber:
	$(call github_download_binary_release,segmentio,v$(CHAMBER_VERSION),$@-v$(CHAMBER_VERSION)-$(OS)-$(ARCH))

export FETCH_VERSION ?= 0.2.0
## Install fetch to easily download files, folders, and release assets from a specific git commit, branch, or tag
fetch:
	$(call github_download_binary_release,gruntwork-io,v$(FETCH_VERSION),$@_$(OS)_$(ARCH))

export GITHUB_COMMENTER_VERSION ?= 0.1.0
## Install github-commenter
github-commenter:
	$(call github_download_binary_release,cloudposse,$(GITHUB_COMMENTER_VERSION),$@_$(OS)_$(ARCH))

export GOMPLATE_VERSION ?= 2.6.0
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

export HELMFILE_VENDOR ?= roboll
export HELMFILE_VERSION ?= 0.13.0
## Install helmfile to easily deploy collections of helm charts
helmfile:
	$(call github_download_binary_release,$(HELMFILE_VENDOR),v$(HELMFILE_VERSION),$@_$(OS)_$(ARCH))

export HTMLTEST_VERSION ?= 0.9.1
## Install htmltest (darwin)
htmltest-darwin:
	mkdir -p $(TMP)/$@
	$(CURL) -o - https://github.com/wjdp/htmltest/releases/download/v$(HTMLTEST_VERSION)/htmltest_$(HTMLTEST_VERSION)_osx_$(ARCH).tar.gz | tar -C $(INSTALL_PATH) -zx htmltest
	chmod +x $(INSTALL_PATH)/htmltest

## Install htmltest (linux)
htmltest-linux:
	$(CURL) -o - https://github.com/wjdp/htmltest/releases/download/v$(HTMLTEST_VERSION)/htmltest_$(HTMLTEST_VERSION)_$(OS)_$(ARCH).tar.gz | tar -C $(INSTALL_PATH) -zx htmltest 
	chmod +x $(INSTALL_PATH)/htmltest

## Install htmltest
htmltest: htmltest-$(OS)
	@exit 0

## Install hugo framework for building static websites (darwin)
hugo-darwin:
	$(CURL) -o - https://github.com/gohugoio/hugo/releases/download/v$(HUGO_VERSION)/hugo_$(HUGO_VERSION)_macOS-64bit.tar.gz | tar -zxO  hugo > $(INSTALL_PATH)/hugo
	chmod +x $(INSTALL_PATH)/hugo

## Install hugo framework for building static websites (linux)
hugo-linux:
	$(CURL) -o - https://github.com/gohugoio/hugo/releases/download/v$(HUGO_VERSION)/hugo_$(HUGO_VERSION)_Linux-64bit.tar.gz | tar -zxO  hugo > $(INSTALL_PATH)/hugo
	chmod +x $(INSTALL_PATH)/hugo

export HUGO_VERSION ?= 0.40.1
## Install hugo framework for building static websites.
hugo: hugo-$(OS)
	@exit 0

export KOPS_VERSION ?= 1.8.0
## Install kops
kops:
	$(call github_download_binary_release,kubernetes,$(KOPS_VERSION),$@-$(OS)-$(ARCH))

export KUBECTL_VERSION ?= 1.8.7
## Install kubectl
kubectl:
	$(CURL) -o $(INSTALL_PATH)/$@ https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/$(OS)/$(ARCH)/kubectl
	chmod +x $(INSTALL_PATH)/$@

export KUBECTX_VERSION ?= 0.5.0
## Install kubectx
kubectx:
	$(CURL) -o $(INSTALL_PATH)/$@ https://raw.githubusercontent.com/ahmetb/$@/v$(KUBECTX_VERSION)/$@
	chmod +x $(INSTALL_PATH)/$@

export KUBENS_VERSION ?= 0.5.0
## Install kubens
kubens:
	$(CURL) -o $(INSTALL_PATH)/$@ https://raw.githubusercontent.com/ahmetb/kubectx/v$(KUBECTX_VERSION)/$@
	chmod +x $(INSTALL_PATH)/$@

export SOPS_VERSION ?= 3.0.3
## Install sops (required by `helm-secrets`)
sops:
	$(call github_download_binary_release,mozilla,$(SOPS_VERSION),$@-$(SOPS_VERSION).$(OS))

export STERN_VERSION ?= 1.7.0
## Install stern multi pod and container log tailing for Kubernetes
stern:
	$(call github_download_binary_release,wercker,$(STERN_VERSION),$@_$(OS)_$(ARCH))

export TERRAFORM_VERSION ?= 0.11.5
## Install Terraform
terraform:
	mkdir -p $(TMP)/$@
	$(CURL) -o $(TMP)/$@/terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_$(OS)_$(ARCH).zip
	unzip -d $(TMP)/$@ $(TMP)/$@/terraform.zip
	mv $(TMP)/$@/terraform $(INSTALL_PATH)/$@
	chmod +x $(INSTALL_PATH)/$@

export TERRAFORM_DOCS_VERSION ?= 0.3.0
## Install terraform-docs to generate docs from terraform modules
terraform-docs:
	$(call github_download_binary_release,segmentio,v$(TERRAFORM_DOCS_VERSION),$@_$(OS)_$(ARCH))

export TERRAGRUNT_VERSION ?= 0.14.7
## Install terragrunt for tools that make it easier to work with multiple Terraform modules
terragrunt:
	$(call github_download_binary_release,gruntwork-io,v$(TERRAGRUNT_VERSION),$@_$(OS)_$(ARCH))

export YQ_VERSION ?= 1.14.1
## Install YQ to manipulte YAML
yq:
	$(call github_download_binary_release,mikefarah,$(YQ_VERSION),$@_$(OS)_$(ARCH))

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
