ARCH ?= amd64
OS ?= $(shell uname -s | tr '[:upper:]' '[:lower:'])
INSTALL_PATH ?= /usr/local/bin
CURL ?= curl --fail -sSL
TMP ?= /tmp

# Macro to download a github binary release
# $(call github_download_binary_release,version,repo,asset)
github_download_binary_release = $(CURL) -o $(INSTALL_PATH)/$@ https://github.com/$(1)/$@/releases/download/$(2)/$(3) && chmod +x $(INSTALL_PATH)/$@

all: awless \
	aws-vault \
	cfssl \
	chamber \
	cloudflared \
	ctop \
	fetch \
	figurine \
	github-commenter \
	gomplate \
	goofys \
	gotop \
	helm \
	helmfile \
	htmltest \
	hugo \
	json2hcl \
	kops \
	kubectl \
	kubectx \
	kubens \
	lectl \
	packer \
	shellcheck \
	shfmt \
	sops \
	stern \
	teleport \
	terraform \
	terraform-docs \
	terragrunt \
	yq 

export AWLESS_VERSION ?= 0.1.11
# Releases: https://github.com/wallix/awless/releases
## Install awless a powerful, innovative and small surface command line interface (CLI) to manage Amazon Web Services
awless:
	mkdir -p $(TMP)/$@
	$(CURL) -o - https://github.com/wallix/$@/releases/download/v$(AWLESS_VERSION)/$@-$(OS)-$(ARCH).tar.gz | tar -C $(TMP)/$@ -zx $@
	mv $(TMP)/$@/$@ $(INSTALL_PATH)/$@
	rm -rf $(TMP)/$@
	chmod +x $(INSTALL_PATH)/$@

export AWS_VAULT_VERSION ?= 4.2.1
# Releases: https://github.com/99designs/aws-vault/releases
## Install aws-vault to easily assume roles (not related to HashiCorp Vault)
aws-vault:
	$(call github_download_binary_release,99designs,v$(AWS_VAULT_VERSION),$@-$(OS)-$(ARCH))

export CFSSL_VERSION ?= 1.3.2
# Releases: https://github.com/cloudflare/cfssl/releases
## Install cfssl - Cloudflare's PKI and TLS toolkit 
cfssl:
	@echo "The '$@' package is only availble in cloudposse/packages docker image"

export CHAMBER_VERSION ?= 2.1.0
# Releases: https://github.com/segmentio/chamber/releases
## Install Chamber to manage secrets with SSM+KMS
chamber:
	$(call github_download_binary_release,segmentio,v$(CHAMBER_VERSION),$@-v$(CHAMBER_VERSION)-$(OS)-$(ARCH))

# Releases: https://developers.cloudflare.com/argo-tunnel/downloads/
## Install cloudflared which offers an easy way to expose web servers securely to the internet(Argo Tunnel)
cloudflared:
	$(CURL) -o - https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-$(OS)-$(ARCH).tgz | tar -zxO  cloudflared > $(INSTALL_PATH)/cloudflared
	chmod +x $(INSTALL_PATH)/cloudflared

export CTOP_VERSION ?= 0.7.1
# Releases: https://github.com/bcicen/ctop/releases
## Install ctop which offers a top-like interface for container metrics
ctop:
	$(call github_download_binary_release,bcicen,v$(CTOP_VERSION),$@-$(CTOP_VERSION)-$(OS)-$(ARCH))
	chmod +x $(INSTALL_PATH)/ctop

export FETCH_VERSION ?= 0.2.0
# Releases: https://github.com/gruntwork-io/fetch/releases
## Install fetch to easily download files, folders, and release assets from a specific git commit, branch, or tag
fetch:
	$(call github_download_binary_release,gruntwork-io,v$(FETCH_VERSION),$@_$(OS)_$(ARCH))

export FIGURINE_VERSION ?= 0.2.2
# Releases: https://github.com/arsham/figurine/releases
## Install figurine to generate fancy colorized ASCII banners
figurine: 
	$(CURL) -o - https://github.com/arsham/figurine/releases/download/v$(FIGURINE_VERSION)/figurine_$(OS)_v$(FIGURINE_VERSION).tar.gz | tar -zxO  figurine > $(INSTALL_PATH)/figurine
	chmod +x $(INSTALL_PATH)/figurine

export GITHUB_COMMENTER_VERSION ?= 0.1.2
## Install github-commenter
github-commenter:
	$(call github_download_binary_release,cloudposse,$(GITHUB_COMMENTER_VERSION),$@_$(OS)_$(ARCH))

export GITHUB_RELEASE_VERSION ?= 0.7.2
## Install github-release to create and edit releases on Github (and upload artifacts)
github-release:
	mkdir -p $(TMP)/$@
	$(CURL) -o - https://github.com/aktau/$@/releases/download/v$(GITHUB_RELEASE_VERSION)/$(OS)-$(ARCH)-$@.tar.bz2 | tar -C $(TMP)/$@ -zx bin/$(OS)/$(ARCH)/$@
	mv $(TMP)/$@/bin/$(OS)/$(ARCH)/$@ $(INSTALL_PATH)/$@
	rm -rf $(TMP)/$@
	chmod +x $(INSTALL_PATH)/$@

export GOMPLATE_VERSION ?= 2.8.0
# Releases: https://github.com/hairyhenderson/gomplate/releases
## Install gomplate
gomplate:
	$(call github_download_binary_release,hairyhenderson,$(GOMPLATE_VERSION),$@_$(OS)-$(ARCH)-slim)

export GOOFYS_VERSION ?= 0.19.0
# Releases: https://github.com/kahing/goofys/releases
## Install goofys
goofys:
	$(call github_download_binary_release,kahing,v$(GOOFYS_VERSION),$@)

export GOTOP_VERSION ?= 1.4.1
# Releases: https://github.com/cjbassi/gotop/releases
## Install gotop which offers a terminal based graphical activity monitor inspired by gtop and vtop
gotop:
	$(CURL) -o - https://github.com/cjbassi/gotop/releases/download/$(GOTOP_VERSION)/$@_$(GOTOP_VERSION)_$(OS)_$(ARCH).tgz | tar -zxO  gotop > $(INSTALL_PATH)/gotop
	chmod +x $(INSTALL_PATH)/gotop

export HELM_VERSION ?= 2.10.0
## Install helm
helm:
	mkdir -p $(TMP)/$@
	$(CURL) -o - http://storage.googleapis.com/kubernetes-helm/helm-v${HELM_VERSION}-$(OS)-$(ARCH).tar.gz | tar -C $(TMP)/$@ -zx $(OS)-$(ARCH)/helm
	mv $(TMP)/$@/$(OS)-$(ARCH)/helm $(INSTALL_PATH)/$@
	rm -rf $(TMP)/$@
	chmod +x $(INSTALL_PATH)/helm

export HELMFILE_VENDOR ?= roboll
export HELMFILE_VERSION ?= 0.25.0
# Releases: https://github.com/roboll/helmfile/releases
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

# Releases: https://github.com/wjdp/htmltest/releases
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

export HUGO_VERSION ?= 0.45.1
# Releases: https://github.com/gohugoio/hugo/releases
## Install hugo framework for building static websites.
hugo: hugo-$(OS)
	@exit 0

export JSON2HCL_VERSION ?= 0.0.6
# Releases: https://github.com/kvz/json2hcl/releases
## Install json2hcl which can convert JSON to HCL, and vice versa
json2hcl:
	$(call github_download_binary_release,kvz,v$(JSON2HCL_VERSION),$@_v$(JSON2HCL_VERSION)_$(OS)_$(ARCH))

export KOPS_VERSION ?= 1.10.0
# Releases: https://github.com/kubernetes/kops/releases
## Install kops
kops:
	$(call github_download_binary_release,kubernetes,$(KOPS_VERSION),$@-$(OS)-$(ARCH))

export KUBECTL_VERSION ?= 1.9.1
# Releases: https://github.com/kubernetes/kubernetes/releases
## Install kubectl
kubectl:
	$(CURL) -o $(INSTALL_PATH)/$@ https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/$(OS)/$(ARCH)/kubectl
	chmod +x $(INSTALL_PATH)/$@

export KUBECTX_VERSION ?= 0.5.0
# Releases: https://github.com/ahmetb/kubectx/releases
## Install kubectx
kubectx:
	$(CURL) -o $(INSTALL_PATH)/$@ https://raw.githubusercontent.com/ahmetb/$@/v$(KUBECTX_VERSION)/$@
	chmod +x $(INSTALL_PATH)/$@

export KUBENS_VERSION ?= 0.5.0
## Install kubens
kubens:
	$(CURL) -o $(INSTALL_PATH)/$@ https://raw.githubusercontent.com/ahmetb/kubectx/v$(KUBECTX_VERSION)/$@
	chmod +x $(INSTALL_PATH)/$@

export LECTL_VERSION ?= 0.16
# Releases: https://github.com/sahsanu/lectl/releases
## Install lectl script to check issued certificates by Let's Encrypt on CTL
lectl:
	$(CURL) -o - https://raw.githubusercontent.com/sahsanu/lectl/v$(LECTL_VERSION)/lectl > $(INSTALL_PATH)/lectl
	chmod +x $(INSTALL_PATH)/lectl

export PACKER_VERSION ?= 1.2.5
# Releases: https://github.com/hashicorp/packer/releases
## Install packer - a tool for creating identical machine images for multiple platforms from a single source configuration.
packer:
	$(CURL) -o - https://releases.hashicorp.com/$@/$(PACKER_VERSION)/$@_$(PACKER_VERSION)_$(OS)_$(ARCH).zip > $(INSTALL_PATH)/$@.zip
	unzip -p $(INSTALL_PATH)/$@.zip $@ > $(INSTALL_PATH)/$@
	rm $(INSTALL_PATH)/$@.zip
	chmod +x $(INSTALL_PATH)/$@
	
export SHELLCHECK_VERSION ?= 0.5.0
# Releases: https://github.com/koalaman/shellcheck/releasess
## Install shellcheck static analysis tool for shell scripts 
shellcheck: 
	$(CURL) -o - https://storage.googleapis.com/shellcheck/shellcheck-v$(SHELLCHECK_VERSION).$(OS).x86_64.tar.xz | tar -xJO shellcheck-v$(SHELLCHECK_VERSION)/shellcheck > $(INSTALL_PATH)/shellcheck
	chmod +x $(INSTALL_PATH)/shellcheck

export SHFMT_VERSION ?= 2.5.1
# Releases: https://github.com/mvdan/sh/releases
## Install shfmt - shell parser, formatter and interpreter
shfmt:
	$(CURL) -o - https://github.com/mvdan/sh/releases/download/v$(SHFMT_VERSION)/shfmt_v$(SHFMT_VERSION)_$(OS)_$(ARCH) > $(INSTALL_PATH)/shfmt
	chmod +x $(INSTALL_PATH)/shfmt

export SOPS_VERSION ?= 3.0.5
## Install sops (required by `helm-secrets`)
sops:
	$(call github_download_binary_release,mozilla,$(SOPS_VERSION),$@-$(SOPS_VERSION).$(OS))

export STERN_VERSION ?= 1.8.0
## Install stern multi pod and container log tailing for Kubernetes
stern:
	$(call github_download_binary_release,wercker,$(STERN_VERSION),$@_$(OS)_$(ARCH))

export TELEPORT_VERSION ?= 2.7.4
# Releases: https://github.com/gravitational/teleport/releases
## Install Teleport
teleport:
	$(CURL) https://get.gravitational.com/teleport/$(TELEPORT_VERSION)/teleport-v$(TELEPORT_VERSION)-${OS}-$(ARCH)-bin.tar.gz -o - | tar -C $(INSTALL_PATH) -zx --wildcards --strip-components=1 --overwrite --mode='+x'  */tsh */tctl */teleport

export TERRAFORM_VERSION ?= 0.11.7
# Releases: https://github.com/hashicorp/terraform/releases
## Install Terraform
terraform:
	mkdir -p $(TMP)/$@
	$(CURL) -o $(TMP)/$@/terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_$(OS)_$(ARCH).zip
	unzip -d $(TMP)/$@ $(TMP)/$@/terraform.zip
	mv $(TMP)/$@/terraform $(INSTALL_PATH)/$@
	chmod +x $(INSTALL_PATH)/$@

export TERRAFORM_DOCS_VERSION ?= 0.3.0
# Releases: https://github.com/segmentio/terraform-docs/releases
## Install terraform-docs to generate docs from terraform modules
terraform-docs:
	$(call github_download_binary_release,segmentio,v$(TERRAFORM_DOCS_VERSION),$@_$(OS)_$(ARCH))

export TERRAGRUNT_VERSION ?= 0.16.3
# Releases: https://github.com/gruntwork-io/terragrunt/releases
## Install terragrunt for tools that make it easier to work with multiple Terraform modules
terragrunt:
	$(call github_download_binary_release,gruntwork-io,v$(TERRAGRUNT_VERSION),$@_$(OS)_$(ARCH))

export YQ_VERSION ?= 2.1.1
## Install YQ to manipulte YAML
yq:
	$(call github_download_binary_release,mikefarah,$(YQ_VERSION),$@_$(OS)_$(ARCH))

export GHR_VERSION ?= 0.10.1
# Releases: https://github.com/tcnksm/ghr/releases
## Install ghr to easily upload multiple artifacts to GitHub Release (Darwin)
ghr-darwin:
	$(CURL) -o - https://github.com/tcnksm/ghr/releases/download/v$(GHR_VERSION)/ghr_v$(GHR_VERSION)_darwin_$(ARCH).zip > $(INSTALL_PATH)/ghr.zip
	unzip -p $(INSTALL_PATH)/ghr.zip */ghr > $(INSTALL_PATH)/ghr
	rm $(INSTALL_PATH)/ghr.zip
	chmod +x $(INSTALL_PATH)/ghr

## Install ghr to easily upload multiple artifacts to GitHub Release (Linux)
ghr-linux:
	$(CURL) -o - https://github.com/tcnksm/ghr/releases/download/v$(GHR_VERSION)/ghr_v$(GHR_VERSION)_linux_$(ARCH).tar.gz | tar --wildcards -zxO */ghr > $(INSTALL_PATH)/ghr
	chmod +x $(INSTALL_PATH)/ghr

## Install ghr to easily upload multiple artifacts to GitHub Release
ghr: ghr-$(OS)
	@exit 0

export GITLEAKS_VERSION ?= 1.2.0
# Releases: https://github.com/zricethezav/gitleaks/releases
## Install gitleaks to audit git repos for secrets
gitleaks:
	$(call github_download_binary_release,zricethezav,v$(GITLEAKS_VERSION),$@-$(OS)-$(ARCH))

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
