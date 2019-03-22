TARGET_BRANCH ?= master
CURRENT_BRANCH ?= 
BUILD_LIST_TARGET ?= list/all

## Install alpine build deps
deps:
	apk add alpine-sdk shadow

## List only updated packages or all if apk, tasks or codefresh folders was updated
list/updated:
	$(eval CHANGES=$(shell git --no-pager diff --name-only origin/$(TARGET_BRANCH) | \
	 xargs -n 1 -r dirname | \
	 sort -u | grep -E '.+'))
	@echo $(CHANGES) | tr ' ' '\n' | grep -E '(apk|tasks|codefresh)' \
	 && ($(MAKE) list/all) \
	 || (echo $(CHANGES) | tr ' ' '\n' | grep -E '^vendor/' | sed 's,vendor/,,' ; exit 0)

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

## Build only updated packages or all if sensitive folders affected
build/updated:
	@BUILD_LIST_TARGET=list/updated $(MAKE) build
