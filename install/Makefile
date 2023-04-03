INSTALL_PATH ?= /usr/local/bin
VENDOR_PATH ?= ../vendor

all: $(shell find $(VENDOR_PATH) -maxdepth 1 -mindepth 1 -type d | xargs -n 1 basename | sort )
	@exit 0

## Install a specific package
%:
	# This needs to be compatible with /bin/sh and not just bash
	@if [ -d $(VENDOR_PATH)/$@ ]; then \
  	  if [ "$$(make -C $(VENDOR_PATH)/$@ info/package-enabled)" != "true" ]; then \
  	    echo "Package $@ no longer supported. Skipping"; \
  	    exit 0; \
  	  elif [ "$$(make -C $(VENDOR_PATH)/$@ info/arch-enabled)" != "true" ]; then \
  	    echo "Package $@ not supported on this CPU. Skipping"; \
  	    exit 0; \
  	  fi; \
	  make -C $(VENDOR_PATH)/$@ install; \
	else \
	  echo "$@ not available"; \
	  exit 1; \
	fi
