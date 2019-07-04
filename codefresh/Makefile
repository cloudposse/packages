export:
	@echo "$(KEY_RSA)" | base64 -d > /dev/shm/key.rsa
	@echo "$(KEY_RSA_PUB)" | base64 -d > /dev/shm/key.rsa.pub
	@echo PACKAGER_PRIVKEY=/dev/shm/key.rsa >> $(CF_VOLUME_PATH)/env_vars_to_export

## Restore mtime
mtime:
	git ls-tree -r --name-only HEAD ../ | while read filename; do \
	  unixtime=$$(git log -1 --format="%at" -- $$filename); \
	  touchtime=$$(date -d @$$unixtime +'%Y%m%d%H%M.%S'); \
	  touch -t $$touchtime $$filename; \
	done
