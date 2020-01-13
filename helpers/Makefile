SHELL := /bin/bash

new/package:
	rm -rf $$(pwd)/../tmp/build.helpers
	mkdir -p $$(pwd)/../tmp/build.helpers
	make -C ../install INSTALL_PATH=$$(pwd)/../tmp/build.helpers gomplate
	BINPATH=$$(pwd)/../tmp/build.helpers $$(pwd)/new-package.sh