PACKAGES  = $(sort $(dir $(wildcard */)))

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

## Update all packages
update:
	find . -mindepth 1 -maxdepth 1 -type d | xargs -I{} make -C {} update

## Show available packages
help:
	@find . -mindepth 1 -maxdepth 1 -type d | sort -u | xargs -I{} make --no-print-directory -s -C {} info/short
