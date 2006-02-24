#! /bin/sh

cat > Makefile << EOF
all: src_copy
	pushd src_copy; \$(MAKE) all; popd

check:
	echo Check Not Implemented > /dev/null

xcheck:
	echo XCheck Not Implemented > /dev/null

install:
	pushd src_copy; \$(MAKE) install; popd

distclean: src_copy
	rm -rf ./src_copy

uninstall:
	rm -rf /usr/local/qmp/mvia

src_copy:
	cp -r ../../../qmp-mvia-mesh ./src_copy
EOF
