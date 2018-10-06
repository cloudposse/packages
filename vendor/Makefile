TARGET_BRANCH ?= master
CURRENT_BRANCH ?= 

## List all packages which have been updated relative to `master`
list/updated:
	@git --no-pager diff --name-only origin/$(CURRENT_BRANCH) `git merge-base origin/$(CURRENT_BRANCH) origin/$(TARGET_BRANCH)` | \
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
	$(MAKE) --no-print-directory -s list/all | \
		xargs -n 1 -I{} -- /bin/sh -c 'make --no-print-directory -C {} info apk || exit 255'

## Update all packages
update:
	find . -mindepth 1 -maxdepth 1 -type d | xargs -I{} make -C {} update
