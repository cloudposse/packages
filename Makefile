export DOCKER_ORG ?= cloudposse
export DOCKER_IMAGE ?= $(DOCKER_ORG)/packages
export DOCKER_TAG ?= latest
export DOCKER_IMAGE_NAME ?= $(DOCKER_IMAGE):$(DOCKER_TAG)
export DOCKER_BUILD_FLAGS = 

export DEFAULT_HELP_TARGET := help/install
export README_DEPS ?= docs/targets.md

export DIST_CMD ?= cp -a
export DIST_PATH ?= /dist
export INSTALL_PATH ?= /usr/local/bin

-include $(shell curl -sSL -o .build-harness "https://git.io/build-harness"; echo .build-harness)

all: init deps build install run

deps:
	@exit 0

## Create a distribution by coping $PACKAGES from $INSTALL_PATH to $DIST_PATH
dist:
	mkdir -p $(DIST_PATH)
	cd $(INSTALL_PATH) && $(DIST_CMD) $(PACKAGES) $(DIST_PATH)

build:
	@make --no-print-directory docker:build

push:
	docker push $(DOCKER_IMAGE)

run:
	docker run -it ${DOCKER_IMAGE_NAME} sh

## Build alpine packages for testing
docker/build/apk:
	docker run \
		-e CURRENT_BRANCH=$$(git rev-parse --abbrev-ref HEAD) \
		-e BUILD_LIST_TARGET=list/updated \
		-v $$(pwd):/packages alpine:3.8 \
		sh -c "apk add alpine-sdk shadow bash && make -C /packages/vendor build"


help/install:
	@$(SELF) help/generate MAKEFILE_LIST=install/Makefile
