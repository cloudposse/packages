INSTALL_PATH ?= /usr/local/bin

## Uninstall a specific package
%:
	@if [ -d ../vendor/$@ ]; then \
	  make -C ../vendor/$@ install; \
	else \
	  echo "$@ not available"; \
	  exit 1; \
	fi
