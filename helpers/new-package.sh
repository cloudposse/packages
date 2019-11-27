#!/bin/bash
# Creates a new package based on templates
# Author: Zachary Loeber

HEIGHT=15
WIDTH=80
BINPATH=${BINPATH:-"tmp/build.helpers"}

APP=$(whiptail --inputbox "Application Name" 8 78 "newapp" --title "Application Info" 3>&1 1>&2 2>&3)
if [ $? -ne 0 ]; then
    exit 0
fi

if [ -d "vendor/${APP}" ]; then
    echo  "vendor/${APP} already exists!"
    exit 1
fi

OPTIONS=(bin "github binary"
         tarball "github tarball"
         custom_tarball "custom tarball")

packageType=$(whiptail \
    --clear \
    --title "New Package Form" \
    --menu "Package Template Type" \
    $HEIGHT $WIDTH 4 \
    "${OPTIONS[@]}" \
    3>&1 1>&2 2>&3)

if [ $? -ne 0 ]; then
    exit 0
fi

VENDOR=$(whiptail --inputbox "Appcation Vendor" 8 78 "vendor" --title "Application Info" 3>&1 1>&2 2>&3)
if [ $? -ne 0 ]; then
    exit 0
fi

DESC=$(whiptail --inputbox "Appcation Description" 8 78 "A short description" --title "Application Info" 3>&1 1>&2 2>&3)
if [ $? -ne 0 ]; then
    exit 0
fi

VERSION=$(whiptail --inputbox "Appcation Version" 8 78 "0.0.0" --title "Application Info" 3>&1 1>&2 2>&3)
if [ $? -ne 0 ]; then
    exit 0
fi

# Construct a generic url to use based on selections
case $packageType in
    bin)
        URL="\$(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/${APP}-$(PACKAGE_VERSION).\$(OS)-\$(ARCH).tar.gz"
        ;;
    tarball)
        URL="\$(PACKAGE_REPO_URL)/releases/download/v$(PACKAGE_VERSION)/${APP}-$(PACKAGE_VERSION).\$(OS)-\$(ARCH).tar.gz"
        ;;
    custom_tarball)
        URL="http://<website.name>/website.path/v$(PACKAGE_VERSION)/${APP}-$(PACKAGE_VERSION).\$(OS)-\$(ARCH).tar.gz"
        ;;
esac
URL=$(whiptail --inputbox "Appcation URL" 8 78 "${URL}" --title "Application Info" 3>&1 1>&2 2>&3)
if [ $? -ne 0 ]; then
     exit 0
fi

export VENDOR APP DESC VERSION URL

echo "Template path for new application: ./vendor/${APP}"
mkdir -p vendor/${APP}

${BINPATH}/gomplate \
  --input-dir helpers/templates/${packageType} \
  --output-dir vendor/${APP} || rm -rf vendor/${APP}

if [ -d vendor/${APP} ]; then
## Uncomment to enable auto-update of .github/auto-label.yml
#   LABEL="vendor/${APP}: vendor/${APP}/**"
#   if grep -q "${LABEL}" .github/auto-label.yml; then
#     echo "${APP} already found in .github/auto-label.yml!"
#   else
#     echo "${LABEL}" >> .github/auto-label.yml
#     echo "${APP} added to .github/auto-label.yml!"
#   fi
  echo ""
  echo "New package path: vendor/${APP}"
  echo "NOTE: Review and update all files within the new package path. Then test your app install with the following:"
  echo "  make -C install ${APP} INSTALL_PATH=/tmp"
  echo ""
fi