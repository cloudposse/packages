TARGET_BRANCH ?= master
CURRENT_BRANCH ?= 

## List all packages which have been updated relative to `master`
list/updated:
	@git --no-pager diff --name-only origin/$(CURRENT_BRANCH) `git merge-base origin/$(CURRENT_BRANCH) origin/$(TARGET_BRANCH)` | \
		xargs -n 1 -r dirname | \
		sort -u | \
		grep -E '^vendor/' | \
		sed 's,vendor/,,' | \
		grep -E '.+'

## Build all updated alpine packages
build:
	$(MAKE) --no-print-directory -s list/updated | \
		xargs -n 1 -I{} -- make --no-print-directory -C {} apk

## Update all packages
update:
	find . -mindepth 1 -maxdepth 1 -type d | xargs -I{} make -C {} update
