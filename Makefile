export DOCKER_ORG ?= cloudposse
export DOCKER_IMAGE ?= $(DOCKER_ORG)/packages
export DOCKER_TAG ?= latest
export DOCKER_IMAGE_NAME ?= $(DOCKER_IMAGE):$(DOCKER_TAG)
export DOCKER_BUILD_FLAGS = 

export DEFAULT_HELP_TARGET := help/vendor
export README_DEPS ?= .github/auto-label.yml docs/badges.md workflows

export DIST_CMD ?= cp -a
export DIST_PATH ?= /dist
export ALPINE_VERSION ?= 3.12

SHELL := /bin/bash

-include $(shell curl -sSL -o .build-harness "https://git.io/build-harness"; echo .build-harness)

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

.github/auto-label.yml:: PACKAGES=$(sort $(dir $(wildcard vendor/*/)))
.github/auto-label.yml::
	cp .github/auto-label-default.yml $@
	for vendor in $(PACKAGES); do \
		echo "$${vendor%/}: $${vendor}**"; \
	done >> $@

.PHONY : docs/badges.md
## Update `docs/targets.md` from `make help`
docs/badges.md: docs/deps
	@( \
		echo "## Package Build Status"; \
		echo "| Build Status | Version | Description |"; \
		echo "| ------------ | ------- | ----------- |"; \
		$(SELF) --no-print-directory --quiet --silent help/md | sed $$'s,\x1b\\[[0-9;]*[a-zA-Z],,g'; \
	) > $@

## Build alpine packages for testing
docker/build/apk:
	docker build -t cloudposse/apkbuild:$(ALPINE_VERSION) -f apk/Dockerfile-$(ALPINE_VERSION) .
	docker run \
		--name apkbuild \
		--rm \
		-e APK_PACKAGES_PATH=/packages/artifacts/$(ALPINE_VERSION) \
		-v $$(pwd):/packages cloudposse/apkbuild:$(ALPINE_VERSION) \
		sh -c "make -C /packages/vendor build"

docker/build/apk/all:
	docker build -t cloudposse/apkbuild:$(ALPINE_VERSION) -f apk/Dockerfile-$(ALPINE_VERSION) .
	docker run \
		--name apkbuild \
		--rm \
		-e APK_PACKAGES_PATH=/packages/artifacts/$(ALPINE_VERSION) \
		-v $$(pwd):/packages cloudposse/apkbuild:$(ALPINE_VERSION) \
		sh -c "make -C /packages/vendor build"

## Build alpine packages for testing
docker/build/apk/shell:
	rm -rf tmp/*
	[ -n "$(ls tmp/)" ] && sudo rm -rf tmp/* || true
	docker build -t cloudposse/apkbuild:$(ALPINE_VERSION) -f apk/Dockerfile-$(ALPINE_VERSION) .
	docker run \
		--name apkbuild \
		--rm \
		-it \
		-e AWS_SECRET_ACCESS_KEY \
		-e AWS_ACCESS_KEY_ID \
		-e AWS_SESSION_TOKEN \
		-e AWS_SECURITY_TOKEN \
		-e APK_PACKAGES_PATH=/packages/artifacts/$(ALPINE_VERSION) \
		--privileged \
		-w /packages \
		-v $$(pwd):/packages cloudposse/apkbuild:$(ALPINE_VERSION)

## Build debian packages for testing
docker/build/deb: DEBIAN_VERSION=stable-slim
docker/build/deb:
	docker build -t cloudposse/fpm:$(DEBIAN_VERSION) -f deb/Dockerfile.$(DEBIAN_VERSION) .
	docker run \
		--name deb \
		--rm \
		-e TMP=/packages/tmp \
		-e DEB_PACKAGES_PATH=/packages/artifacts/$(DEBIAN_VERSION) \
		-v $$(pwd):/packages cloudposse/fpm:$(DEBIAN_VERSION) \
		sh -c "make -C /packages/vendor/github-commenter deb"

## Build debian packages for testing
docker/build/deb/shell: DEBIAN_VERSION=stable-slim
docker/build/deb/shell:
	docker build -t cloudposse/fpm:$(DEBIAN_VERSION) -f deb/Dockerfile.$(DEBIAN_VERSION) .
	docker run \
		-it \
		--name deb \
		--rm \
		-e TMP=/packages/tmp \
		-e DEB_PACKAGES_PATH=/packages/artifacts/$(DEBIAN_VERSION) \
		-v $$(pwd):/packages cloudposse/fpm:$(DEBIAN_VERSION) \
		bash


help/vendor:
	@$(MAKE) --no-print-directory -s -C vendor help

help/md:
	@$(MAKE) --no-print-directory -s -C vendor help/md

update/%:
	rm -f vendor/$(subst update/,,$@)/VERSION
	make -C vendor/$(subst update/,,$@) VERSION
	make readme
