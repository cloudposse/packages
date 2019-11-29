#!/bin/bash
# Creates a new package based on templates
# Author: Zachary Loeber

eval `resize`
HEIGHT=15
WIDTH=80
BINPATH=${BINPATH:-"tmp/build.helpers"}
IGNORED_EXT='(.tar.gz.asc|.txt|.tar.xz)'
OS="${OS:-"linux"}"
ARCH="${ARCH:-"amd64"}"

function get_latest_download_urls_by_platform {
    # Description: Scrape github releases for most recent release of a project based on:
    # vendor, repo, os, and arch
    # Author: Zachary Loeber

    local vendorapp="${1?"Usage: $0 vendor/app"}"
    OS="${OS:-"linux"}"
    ARCH="${ARCH:-"amd64"}"
	curl -s "https://api.github.com/repos/${vendorapp}/releases/latest" | \
        jq -r --arg OS ${OS} --arg ARCH ${ARCH} \
        '.assets[] | select(.browser_download_url | contains($OS)) | select(.browser_download_url | contains($ARCH)) | .browser_download_url'
}

function get_latest_version_by_tag {
    # Attempt to get the latest version of a release by release tag
    local vendorapp="${1?"Usage: $0 vendor/app"}"
    curl -s "https://api.github.com/repos/${vendorapp}/releases/latest" | \
        grep -oP '"tag_name": "\K(.*)(?=")' | \
        grep -o '[[:digit:]].[[:digit:]].[[:digit:]]'
}

APP=$(whiptail --inputbox "Application Name" 8 78 "newapp" --title "Application Info" 3>&1 1>&2 2>&3)
if [ $? -ne 0 ]; then
    exit 0
fi

if [ -d "vendor/${APP}" ]; then
    echo  "vendor/${APP} already exists!"
    exit 1
fi

OPTIONS=(bin "github binary"
         tarball "github tarball")

packageType=$(whiptail \
    --clear \
    --title "New Package Form" \
    --menu "Package Template Type" \
    $LINES $COLUMNS $(( $LINES - 8 )) \
    "${OPTIONS[@]}" \
    3>&1 1>&2 2>&3)
if [ $? -ne 0 ]; then
    exit 0
fi

VENDOR=$(whiptail --inputbox "Github Vendor" 8 78 "vendor" --title "Application Info" 3>&1 1>&2 2>&3)
if [ $? -ne 0 ]; then
    exit 0
fi

REPO=$(whiptail --inputbox "Github Repo" 8 78 "repo" --title "Application Info" 3>&1 1>&2 2>&3)
if [ $? -ne 0 ]; then
    exit 0
fi

DESC=$(whiptail --inputbox "Appcation Description" 8 78 "A short description" --title "Application Info" 3>&1 1>&2 2>&3)
if [ $? -ne 0 ]; then
    exit 0
fi

latesturl=`get_latest_download_urls_by_platform "${VENDOR}/${REPO}" | grep -v -E "${IGNORED_EXT}"`
latestversion=`get_latest_version_by_tag "${VENDOR}/${REPO}" | grep -o -E '[0-9]+.[0-9]+.[0-9]+'`
if [ -z $latestversion ]; then
    latestversion=`echo "${latesturl}" | grep -o -E '[0-9]+.[0-9]+.[0-9]+' | head -1`
fi

VERSION=$(whiptail --inputbox "Latest Github Release Version" 8 78 "${latestversion}" --title "Application Info" 3>&1 1>&2 2>&3)
if [ $? -ne 0 ]; then
    exit 0
fi

# Construct a generic url to use based on selections
PACKAGE_REPO_URL="https://github.com/${VENDOR}/${REPO}"
latesturl=${latesturl/${PACKAGE_REPO_URL}/\$(PACKAGE_REPO_URL)}
latesturl=${latesturl//${VERSION}/\$(PACKAGE_VERSION)}
latesturl=${latesturl//${OS}/\$(OS)}
latesturl=${latesturl//${ARCH}/\$(ARCH)}

URL=$(whiptail --inputbox "Appcation URL" 8 78 "${latesturl}" --title "Application Info" 3>&1 1>&2 2>&3)
if [ $? -ne 0 ]; then
    exit 0
fi

export VENDOR APP DESC VERSION URL REPO

echo "Template path for new application: ./vendor/${APP}"
mkdir -p vendor/${APP}

${BINPATH}/gomplate \
  --input-dir helpers/templates/${packageType} \
  --output-dir vendor/${APP} || rm -rf vendor/${APP}

if [ -d vendor/${APP} ]; then
  echo "** Overview **"
  echo "VENDOR: ${VENDOR}"
  echo "REPO: ${REPO}"
  echo "APP: ${APP}"
  echo "VERSION: ${VERSION}"
  echo "URL: ${URL}"
  echo "Path: vendor/${APP}"
  echo "Type: ${packageType}"
  echo ""
  echo "NOTE: Review and update all files within the new package path."
  echo "(Specifically ensure that the LICENCE is accurate)"
  echo ""
  echo "Test your package install with the following:"
  echo "  make -C install ${APP} INSTALL_PATH=/tmp"
  echo "  /tmp/${APP}"
  echo ""
  echo "Test your package apk build with the following:"
  echo "  make docker/build/apk/shell"
  echo "  make -c vendor/${APP} apk"
  echo "  rm -rf /tmp/build.*"
  echo ""
  echo "Update documentation and package listing with the following:"
  echo "  make docker/build/apk/shell"
  echo "  make int readme/deps readme"
  echo ""
  echo "Pull in upstream sources and prepare for a PR:"
  echo "  git add --all . && git commit -m '[${APP}] New Package'"
  echo "  git remote add upstream git@github.com:cloudposse/packages.git || true"
  echo "  git fetch origin -v; git fetch upstream -v; git merge upstream/master"
fi
