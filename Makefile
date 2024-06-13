export DOCKER_ORG ?= cloudposse
export DOCKER_IMAGE ?= ghcr.io/$(DOCKER_ORG)/packages
export DOCKER_TAG ?= latest
export DOCKER_IMAGE_NAME ?= $(DOCKER_IMAGE):$(DOCKER_TAG)
export DOCKER_BUILD_FLAGS =

export DEFAULT_HELP_TARGET := help/vendor
export README_DEPS ?= .github/auto-label.yml docs/badges.md docs/targets.md workflows

export DIST_CMD ?= cp -a
export DIST_PATH ?= /dist
export ALPINE_VERSION ?= alpine

SHELL := /bin/bash

-include $(shell curl -sSL -o .build-harness "https://cloudposse.tools/build-harness"; echo .build-harness)

all: init deps build install run workflows

deps:
	@exit 0

workflows:
	$(SELF) --no-print-directory --quiet --silent -C .github/ workflows

## Create a distribution by coping $PACKAGES from $INSTALL_PATH to $DIST_PATH
dist: INSTALL_PATH=/usr/local/bin
dist:
	mkdir -p $(DIST_PATH)
	[ -z "$(PACKAGES)" ] || \
		( cd $(INSTALL_PATH) && $(DIST_CMD) $(PACKAGES) $(DIST_PATH) )

build:
	@make --no-print-directory docker:build

push:
	docker push $(DOCKER_IMAGE)

run:
	docker run -it ${DOCKER_IMAGE_NAME} sh

.github/auto-label.yml:: PACKAGES=$(sort $(dir $(wildcard vendor/*/Makefile)))
.github/auto-label.yml::
	cp .github/auto-label-default.yml $@
	for vendor in $(PACKAGES); do \
		printf "$${vendor%/}:\n- any: [\"$${vendor}**\"]\n  all: [\"!bin/**\", \"!tasks/**\"]\n"; \
	done >> $@

.PHONY : docs/badges.md
## Update `docs/badges.md` from `make help`
docs/badges.md: docs/deps
	@( \
		echo '## Package Build Status'; \
		echo '| Build Status (* means `amd64` only) | Version | Description |'; \
		echo '| ----------------------------------- | ------- | ----------- |'; \
		$(SELF) --no-print-directory --quiet --silent help/md | sed $$'s,\x1b\\[[0-9;]*[a-zA-Z],,g'; \
	) > $@

## Build alpine packages for testing
docker/build/apk:
	docker build --load --platform=linux/amd64 -t $(DOCKER_IMAGE)-apkbuild:$(ALPINE_VERSION) -f apk/Dockerfile-$(ALPINE_VERSION) .
	docker run \
		--name apkbuild \
		--rm \
		-e APK_PACKAGES_PATH=/packages/artifacts/$(ALPINE_VERSION) \
		-v $$(pwd):/packages $(DOCKER_IMAGE)-apkbuild:$(ALPINE_VERSION) \
		sh -c "make -C /packages/vendor build"

docker/build/apk/all:
	docker build --load --platform=linux/amd64 -t $(DOCKER_IMAGE)-apkbuild:$(ALPINE_VERSION) -f apk/Dockerfile-$(ALPINE_VERSION) .
	docker run \
		--name apkbuild \
		--rm \
		-e APK_PACKAGES_PATH=/packages/artifacts/$(ALPINE_VERSION) \
		-v $$(pwd):/packages $(DOCKER_IMAGE)-apkbuild:$(ALPINE_VERSION) \
		sh -c "make -C /packages/vendor build"

## Run alpine builder interactively
docker/build/apk/shell run/apk:
	rm -rf tmp/*
	[ -n "$(ls tmp/)" ] && sudo rm -rf tmp/* || true
	docker build --load --platform=linux/amd64 -t $(DOCKER_IMAGE)-apkbuild:$(ALPINE_VERSION) -f apk/Dockerfile-$(ALPINE_VERSION) .
	docker run \
		--name apkbuild \
		--rm \
		-it \
		-e AWS_SECRET_ACCESS_KEY \
		-e AWS_ACCESS_KEY_ID \
		-e AWS_SESSION_TOKEN \
		-e AWS_SECURITY_TOKEN \
		-e TMP=/packages/tmp/apk \
		-e APK_PACKAGES_PATH=/packages/artifacts/$(ALPINE_VERSION) \
		--privileged \
		-w /packages \
		-v $$(pwd):/packages $(DOCKER_IMAGE)-apkbuild:$(ALPINE_VERSION)

# MATRIX BUILD
docker/build/deb/shell docker/build/deb/test run/deb : BUILDER_VERSION=stable-slim

docker/build/rpm/shell docker/build/rpm/test run/rpm : BUILDER_VERSION=ubi

## Build package as a test
docker/build/%/test:
	docker build -t $(DOCKER_IMAGE)-$*build:$(BUILDER_VERSION) -f $*/Dockerfile.$(BUILDER_VERSION) .
	docker run \
		--name $*build \
		--rm \
		-e TMP=/packages/tmp/$* \
		-e PACKAGES_PATH=/packages/artifacts/$*/$(BUILDER_VERSION) \
		-v $$(pwd):/packages $(DOCKER_IMAGE)-$*build:$(BUILDER_VERSION) \
		sh -c "make -C /packages/vendor/github-commenter $*"

## Build package builder shell
docker/build/%/shell run/%:
	rm -rf tmp/*
	[ -n "$(ls tmp/)" ] && sudo rm -rf tmp/* || true
	mkdir -p tmp/$*
	docker build -t $(DOCKER_IMAGE)-$*build:$(BUILDER_VERSION) -f $*/Dockerfile.$(BUILDER_VERSION) .
	docker run \
		-it \
		--name $*build \
		--rm \
		-e TMP=/packages/tmp/$* \
		-e PACKAGES_PATH=/packages/artifacts/$*/$(BUILDER_VERSION) \
		-v $$(pwd):/packages $(DOCKER_IMAGE)-$*build:$(BUILDER_VERSION) \
		bash



help/vendor:
	printf '\n\nPackages marked with * are not available on some architectures (usually missing `arm64`)\n\n'
	@$(MAKE) --no-print-directory -s -C vendor help

help/md:
	@$(MAKE) --no-print-directory -s -C vendor help/md

update/%:
	rm -f vendor/$*/VERSION
	make -C vendor/$* update
	make readme

nuru/%.yaml:
	@echo "* is $*"
	@echo "subst is $(subst .,_,$*)"
