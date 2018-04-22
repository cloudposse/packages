INSTALL_PATH ?= /usr/local/bin

## Uninstall package
%:
	@if [ -f $(INSTALL_PATH)/$@ ]; then \
	  rm -f $(INSTALL_PATH)/$@; \
	  echo "Deleted $@"; \
	else \
	  echo "$@ not installed"; \
	fi
