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

# We're using `sed` because GitHub actions are a mashup of environment variables and go-template like formatting. 
# It's practical to use `envsubst` or `gomplate` if we need to escape every interpolation
workflows/%.yml: .ALWAYS
	@if [[ $$(make -sC ../vendor/$* info/package-enabled) != "false" ]]; then \
  		echo updating $@; \
		sed 's/%PACKAGE_NAME%/$*/g' package-template.yml > $@; \
	else \
		echo DELETING workflow $@ because package is disabled; \
		rm -f $@; \
	fi

.PHONY : workflows .ALWAYS
# This crazy expression gets a list of all the package folders under the vendor folder
# Then it turns it into a file like workflows/terraform.yml and we use it as a build dep
workflows: $(addsuffix .yml,$(addprefix workflows/, $(sort $(notdir $(realpath $(wildcard ../vendor/*/))))))
	@exit 0

