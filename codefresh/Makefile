export PACKAGER_PRIVKEY=$(CF_VOLUME_PATH)/key.rsa
export PACKAGER_PUBKEY=$(APK_PACKAGES_PATH)/ops@cloudposse.com.rsa.pub

export:
	@echo "$(KEY_RSA)" | base64 -d > $(PACKAGER_PRIVKEY)
	@openssl rsa -in $(PACKAGER_PRIVKEY) -pubout > $(PACKAGER_PUBKEY)
	@echo PACKAGER_PRIVKEY=$(PACKAGER_PRIVKEY) >> $(CF_VOLUME_PATH)/env_vars_to_export

## Restore mtime
mtime:
	git ls-tree -r --name-only HEAD ../ | while read filename; do \
	  unixtime=$$(git log -1 --format="%at" -- $$filename); \
	  touchtime=$$(date -d @$$unixtime +'%Y%m%d%H%M.%S'); \
	  touch -t $$touchtime $$filename; \
	done
