#!/bin/bash
# Creates a new package based on templates

HEIGHT=15
WIDTH=80

APP=$(whiptail --inputbox "Application Name" 8 78 "newapp" --title "Application Info" 3>&1 1>&2 2>&3)

if [ $? -ne 0 ]; then
    exit 0
fi

if [ -d "vendor/${APP}" ]; then
    echo  "vendor/${APP} already exists!"
    exit 1
fi

OPTIONS=(bin "github binary"
         targz "github tar.gz"
         custom_bin "custom binary"
         custom_targz "custom tar.gz")

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
        URL="\$(PACKAGE_REPO_URL)/releases/download/v${VERSION}/${APP}-\$(OS)-\$(ARCH).tar.gz"
        ;;
    targz)
        URL="\$(PACKAGE_REPO_URL)/releases/download/v${VERSION}/${APP}-\$(OS)-\$(ARCH).tar.gz"
        ;;
    custom_bin)
        URL="http://website.name/website.path/v${VERSION}/${APP}-\$(OS)-\$(ARCH).tar.gz"
        ;;
    custom_targz)
        URL="http://website.name/website.path/v${VERSION}/${APP}-\$(OS)-\$(ARCH).tar.gz"
        ;;
esac
URL=$(whiptail --inputbox "Appcation URL" 8 78 "${URL}" --title "Application Info" 3>&1 1>&2 2>&3)
if [ $? -ne 0 ]; then
     exit 0
fi

export VENDOR APP DESC VERSION URL

echo "Template path for new application: ./vendor/${APP}"
mkdir -p vendor/${APP}

gomplate \
  --input-dir helpers/templates/${packageType} \
  --output-dir vendor/${APP} || rm -rf vendor/${APP}
