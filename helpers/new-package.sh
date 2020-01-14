#!/bin/bash
# Creates a new package based on templates
# Author: Zachary Loeber

eval `resize`
HEIGHT=15
WIDTH=80
BINPATH=${BINPATH:-"tmp/build.helpers"}
IGNORED_EXT='(.tar.gz.asc|.txt|.tar.xz|.asc|.MD|.hsm|+ent.hsm)'
IGNORED_APPS='(terraform-provider|driver|plugin|vagrant|consul-|docker|helper|atlas-)'
OS="${OS:-"linux"}"
ARCH="${ARCH:-"amd64"}"
VENDORPATH=${VENDORPATH:-"../vendor"}

# Scrapes the Hashicorp release endpoint for valid versions
# Usage: get_hashicorp_version <app>
function get_hashicorp_version () {
	local vendorapp="${1?"Usage: $0 app"}"
	# Scrape HTML from release page for binary versions, which are 
	# given as ${binary}_<version>. We just use sed to extract.
	curl -s "https://releases.hashicorp.com/${vendorapp}/" | grep -v -E "${IGNORED_EXT}" | sed -n "s|.*${vendorapp}_\([0-9\.]*\).*|\1|p" | sed -n 2p
}

# Scrapes the Hashicorp release endpoint for valid apps
# Usage: get_hashicorp_apps <app>
function get_hashicorp_apps () {
	# Scrape HTML from release page for binary app names
    # There MUST be a better way to do this one... :)
    curl -s "https://releases.hashicorp.com/" | grep -o '<a .*href=\"/\(.*\)/">' | cut -d/ -f2 | grep -v -E "${IGNORED_APPS}"
}

function get_github_urls_by_platform {
    # Description: Scrape github releases for most recent release of a project based on:
    # vendor, repo, os, and arch
    local vendorapp="${1?"Usage: $0 vendor/app"}"
    OS="${OS:-"linux"}"
    ARCH="${ARCH:-"amd64"}"
	curl -s "https://api.github.com/repos/${vendorapp}/releases/latest" | \
        jq -r --arg OS ${OS} --arg ARCH ${ARCH} \
        '.assets[] | select(.browser_download_url | contains($OS)) | select(.browser_download_url | contains($ARCH)) | .browser_download_url'
}

function get_github_version_by_tag {
    # Attempt to get the latest version of a release by release tag
    local vendorapp="${1?"Usage: $0 vendor/app"}"
    curl -s "https://api.github.com/repos/${vendorapp}/releases/latest" | \
        grep -oP '"tag_name": "\K(.*)(?=")' | \
        grep -o '[[:digit:]].[[:digit:]].[[:digit:]]'
}

OPTIONS=(bin "github binary"
         tarball "github tarball"
         hashicorp "Hashicorp app")

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

if [ $packageType -ne "hashicorp" ]; then
    APP=$(whiptail --inputbox "Application Name" 8 78 --title "Application Info" 3>&1 1>&2 2>&3)
    if [ $? -ne 0 ]; then
        exit 0
    fi
    DESC=$(whiptail --inputbox "Appcation Description" 8 78 "A short description" --title "Application Info" 3>&1 1>&2 2>&3)
    if [ $? -ne 0 ]; then
        exit 0
    fi
    if [ -d "${VENDORPATH}/${APP}" ]; then
        echo  "${VENDORPATH}/${APP} already exists!"
        exit 1
    else
        echo  "${VENDORPATH}/${APP} is new, continuing.."
    fi
    VENDOR=$(whiptail --inputbox "Github Vendor" 8 78 "vendor" --title "Application Info" 3>&1 1>&2 2>&3)
    if [ $? -ne 0 ]; then
        exit 0
    fi

    REPO=$(whiptail --inputbox "Github Repo" 8 78 "repo" --title "Application Info" 3>&1 1>&2 2>&3)
    if [ $? -ne 0 ]; then
        exit 0
    fi

    latesturl=`get_github_urls_by_platform "${VENDOR}/${REPO}" | grep -v -E "${IGNORED_EXT}"`
    latestversion=`get_github_version_by_tag "${VENDOR}/${REPO}" | grep -o -E '[0-9]+.[0-9]+.[0-9]+'`
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

else
    applist=()
    hashiapps=(`get_hashicorp_apps`)
    cnt=${#hashiapps[@]}
    for ((i=0;i<cnt;i++)); do
        applist+=("${hashiapps[i]}")
        applist+=("")
    done
    APP=$(whiptail --title "Hashicorp Apps" --menu "Choose App" 16 78 10 "${applist[@]}" 3>&1 1>&2 2>&3)
    if [ $? -ne 0 ]; then
        exit 0
    fi
    if [ -d "${VENDORPATH}/${APP}" ]; then
        echo  "${VENDORPATH}/${APP} already exists!"
        exit 1
    else
        echo  "${VENDORPATH}/${APP} is new, continuing.."
    fi
    latestversion=`get_hashicorp_version "${APP}" | grep -o -E '[0-9]+.[0-9]+.[0-9]+'`
    VERSION=$(whiptail --inputbox "Latest ${APP} Release Version" 8 78 "${latestversion}" --title "Application Info" 3>&1 1>&2 2>&3)
    if [ $? -ne 0 ]; then
        exit 0
    fi
    DESC="Hashicorp ${APP}"
fi

export VENDOR APP DESC VERSION URL REPO
echo "Template path for new application: ./${VENDORPATH}/${APP}"
mkdir -p ${VENDORPATH}/${APP}

${BINPATH}/gomplate \
--input-dir $(pwd)/templates/${packageType} \
--output-dir ${VENDORPATH}/${APP} || rm -rf ${VENDORPATH}/${APP}

if [ -d ${VENDORPATH}/${APP} ]; then
  echo "** Overview **"
  echo "VENDOR: ${VENDOR}"
  echo "REPO: ${REPO}"
  echo "APP: ${APP}"
  echo "VERSION: ${VERSION}"
  echo "URL: ${URL}"
  echo "Path: ${VENDORPATH}/${APP}"
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
  echo "  make -c ${VENDORPATH}/${APP} apk"
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
