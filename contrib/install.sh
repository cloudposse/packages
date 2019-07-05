#!/usr/bin/env bash

[ "${DEBUG}" != "true" ] || set -x

if [ ! -f /etc/os-release ]; then
  echo "This does not appear to be an alpine base system"
  exit 1
fi

source /etc/os-release

export ARCH=$(uname -m)
export OS_RELEASE=$(echo ${VERSION_ID} | cut -d. -f1-2)
export PUBKEY="ops@cloudposse.com.rsa.pub"
export APK_PATH="/etc/apk"
export APK_REPO_URL="https://apk.cloudposse.com"
export APK_REPO_VENDOR_URL="${APK_REPO_URL}/${OS_RELEASE}/vendor"

curl -fsL -o /dev/null "${APK_REPO_VENDOR_URL}/${ARCH}/APKINDEX.tar.gz"
if [ $? -ne 0 ]; then
  echo "No repo available for Alpine v${OS_RELEASE} ($ARCH)"
  exit 1
fi

curl -fsL -o "${APK_PATH}/keys/${PUBKEY}" "${APK_REPO_URL}/${PUBKEY}"
if [ $? -ne 0 ]; then
  echo "Failed to download repository public key"
  exit 1
fi

grep -q "${APK_REPO_VENDOR_URL}" "${APK_PATH}/repositories" || \
  echo "@cloudposse ${APK_REPO_VENDOR_URL}" >> "${APK_PATH}/repositories"

apk update

echo "Configured repo for Alpine v${OS_RELEASE} ($ARCH)"
exit 0
