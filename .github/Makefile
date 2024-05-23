SHELL := /bin/bash
# Important filenames must be of the email@host.com pattern and use the `.rsa` and `.rsa.pub` suffixes
# Not doing this will lead to something like "WARNING: Ignoring .../APKINDEX.tar.gz: UNTRUSTED signature"
#
export:
	@mkdir -p $(APK_PACKAGES_PATH)
	@printenv APK_KEY_RSA > $(PACKAGER_PRIVKEY)
	@echo "Exported private key to $(PACKAGER_PRIVKEY)"
	@openssl rsa -in $(PACKAGER_PRIVKEY) -pubout > $(PACKAGER_PUBKEY)
	@echo "Exported public key to $(PACKAGER_PUBKEY)"

# Skip this file...
workflows/Makefile.yml:
	@exit 0

workflows/auto-update-packages.yml: auto-update-template.yml .ALWAYS
	@echo Generating auto-update workflow file
	@set -e; for pkg in $(sort $(filter-out Makefile,$(notdir $(realpath $(wildcard ../vendor/*/))))); do \
	  enabled=$$(make -sC ../vendor/$$pkg info/auto-update-enabled); \
	  if [[ $$enabled != "false" ]]; then \
		LIST+=$$(printf "       - %s\\\\\n " $$pkg); \
	  else \
		echo Auto-update of $$pkg is disabled >&2; \
	  fi; \
	done; \
	sed -e "s/%PACKAGE_LIST%/ $${LIST%?}/" auto-update-template.yml > $@

# We're using `sed` because GitHub actions are a mashup of environment variables and go-template like formatting. 
# It is not practical to use `envsubst` or `gomplate` if we need to escape every interpolation.
workflows/%.yml: .ALWAYS
	@set -e; enabled=$$(make -sC ../vendor/$* info/package-enabled); \
	if [[ $$enabled != "false" ]]; then \
  		echo updating $@; \
		sed 's/%PACKAGE_NAME%/$*/g' package-template.yml | sed 's/%PACKAGE_JSON_NAME%/$(subst .,_,$*)/g' > $@; \
		@git ls-files --error-unmatch $@ &> /dev/null || git add $@; \
	else \
		echo DELETING workflow $@ because package is disabled; \
		git rm -f --ignore-unmatch $@; \
	fi

.PHONY : workflows .ALWAYS
# This crazy expression gets a list of all the package folders under the vendor folder
# Then it turns it into a file like workflows/terraform.yml and we use it as a build dep
builder-workflows: $(addsuffix .yml,$(addprefix workflows/, $(sort $(notdir $(realpath $(wildcard ../vendor/*/))))))
	@:

auto-update-workflow: workflows/auto-update-packages.yml
	@:

workflows: auto-update-workflow builder-workflows
	@:
