TARGET_BRANCH ?= master
CURRENT_BRANCH ?= apk

## List all packages which have been updated relative to `master`
list/updated:
	@git --no-pager diff --name-only origin/$(CURRENT_BRANCH) `git merge-base origin/$(CURRENT_BRANCH) origin/$(TARGET_BRANCH)` | \
		xargs -n 1 -r dirname | \
		sort -u | \
		grep -E '^vendor/' | \
		sed 's,vendor/,,' | \
		grep -E '.+'

## Build all updated packages
build:
	$(MAKE) -s list/updated  | xargs -t -r -I'{}' make -s -C '{}' apk

