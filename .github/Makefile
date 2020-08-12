# Important filenames must be of the email@host.com pattern and use the `.rsa` and `.rsa.pub` suffixes
# Not doing this will lead to something like "WARNING: Ignoring .../APKINDEX.tar.gz: UNTRUSTED signature"
#
export:
	@mkdir -p $(APK_PACKAGES_PATH)
	@echo "$(APK_KEY_RSA)" > $(PACKAGER_PRIVKEY)
	@echo "Exported private key to $(PACKAGER_PRIVKEY)"
	@openssl rsa -in $(PACKAGER_PRIVKEY) -pubout > $(PACKAGER_PUBKEY)
	@echo "Exported public key to $(PACKAGER_PUBKEY)"

