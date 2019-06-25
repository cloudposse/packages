export:
	cf_export CURRENT_BRANCH=$(CF_BRANCH)
	cf_export PACKAGER_PRIVKEY=/dev/shm/key.rsa
	echo "$(KEY_RSA)" | base64 -d > /dev/shm/key.rsa
	echo "$(KEY_RSA_PUB)" | base64 -d > /dev/shm/key.rsa.pub
