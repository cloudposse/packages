VENDOR ?= Azure

include ../../tasks/Makefile.package
include ../../tasks/Makefile.apk

# During installation something tries to write to `/.azure`
apk/prepare::
	install -d /.azure -m 0777

#update::
#	chmod 777 .
#	sudo -u nobody abuild checksum
