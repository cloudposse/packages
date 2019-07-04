export:
	@echo "$(KEY_RSA)" | base64 -d > /dev/shm/key.rsa
	@echo "$(KEY_RSA_PUB)" | base64 -d > /dev/shm/key.rsa.pub
	@echo PACKAGER_PRIVKEY=/dev/shm/key.rsa >> $(CF_VOLUME_PATH)/env_vars_to_export
