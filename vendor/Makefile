PACKAGES  = $(sort $(dir $(wildcard */)))

REPOS = vendor/x86_64
APK_PACKAGE_REPOS ?= $(addprefix $(APK_PACKAGES_PATH)/,$(REPOS))
APK_PACKAGE_INDEX ?= $(addsuffix /APKINDEX.tar.gz,$(APK_PACKAGE_REPOS))
APK_PACKAGES ?= $(wildcard $(addsuffix /*.apk,$(APK_PACKAGE_REPOS)))

default: build

## Install alpine build deps
deps:
	apk add alpine-sdk shadow

prepare:
	chmod 777 ../tmp

## Build all updated alpine packages
build: $(PACKAGES)

$(PACKAGES): prepare
	make --no-print-directory -C $@ apk

labeler:
	for vendor in $(PACKAGES); do \
		echo "vendor/$${vendor%/}: vendor/$${vendor}**"; \
	done > ../.github/vendor.yml

## Update all packages
update:
	find . -mindepth 1 -maxdepth 1 -type d | xargs -I{} make -C {} update

# Rebuild the APKINDEX if it's older than any of the *.apk files
$(APK_PACKAGE_INDEX): $(APK_PACKAGES)
	rm -f $(@).tmp
	apk index -o $(@).tmp $(dir $@)/*.apk
	abuild-sign -k $(PACKAGER_PRIVKEY) $(@).tmp
	mv -f $(@).tmp $(@)

index: $(APK_PACKAGE_INDEX)

# Drop indexes
deindex:
	@find $(APK_PACKAGES_PATH) -type f -name APKINDEX.tar.gz -delete

## Show available packages
help:
	@find . -mindepth 1 -maxdepth 1 -type d | sort -u | xargs -I{} make --no-print-directory -s -C {} info/short
