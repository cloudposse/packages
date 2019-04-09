INSTALL_PATH ?= /usr/local/bin
VENDOR_PATH ?= ../vendor

all: $(shell find $(VENDOR_PATH) -maxdepth 1 -mindepth 1 -type d | xargs -n 1 basename | sort )
	@exit 0

## Install a specific package
%:
	@if [ -d $(VENDOR_PATH)/$@ ]; then \
	  make -C $(VENDOR_PATH)/$@ install; \
	else \
	  echo "$@ not available"; \
	  exit 1; \
	fi
