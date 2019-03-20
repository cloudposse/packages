TARGET_BRANCH ?= master
CURRENT_BRANCH ?= 
BUILD_LIST_TARGET ?= list/all

## Install alpine build deps
deps:
	apk add alpine-sdk shadow

## List all packages which have been updated relative to `master`
list/updated:
	@git --no-pager diff --name-only $(CURRENT_BRANCH) `git merge-base $(CURRENT_BRANCH) origin/$(TARGET_BRANCH)` | \
		xargs -n 1 -r dirname | \
		sort -u | \
		grep -E '^vendor/' | \
		sed 's,vendor/,,' | \
		cut -d/ -f1 | \
		sort -u | \
		grep -E '.+'

list/all:
	@find . -mindepth 1 -maxdepth 1 -type d | cut -d/ -f2

## Build all updated alpine packages
build:
	chmod 777 ../tmp
	$(MAKE) --no-print-directory -s $(BUILD_LIST_TARGET) | \
		xargs -t -n 1 -I{} -- /bin/sh -c 'make --no-print-directory -C {} info apk || exit 255'

## Update all packages
update:
	find . -mindepth 1 -maxdepth 1 -type d | xargs -I{} make -C {} update

## Show available packages
help:
	@find . -mindepth 1 -maxdepth 1 -type d | sort -u | xargs -I{} make --no-print-directory -s -C {} info/short

## Build only updated packages or all if apk, codefresh or tasks was updated
build/updated:
	git --no-pager diff --name-only origin/$(TARGET_BRANCH) | \
		xargs -n 1 -r dirname | \
		sort -u | \
		cut -d/ -f1 | \
		sort -u | \
		grep -E '.+' | \
		grep -E '(apk|tasks|codefresh)' && ($(MAKE) build ) || (BUILD_LIST_TARGET=list/updated $(MAKE) build ; exit 0 )
