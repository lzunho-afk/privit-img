#!/bin/bash
# configure.sh - simple script to build & generate docs for privitdb project
# Lucas Zunho <lucaszunho.pf005@academico.ifsul.edu.br> (c) GPLv3
#
PROJECT_PATH=`pwd`
BUILD_PKGS=0
GEN_DOCS=0

b_libcyaml() {
    cd $1
    make
    mkdir -p $PROJECT_PATH/lib/libcyaml/lib
    mkdir -p $PROJECT_PATH/lib/libcyaml/include
    cp $1/build/release/libcyaml.a $PROJECT_PATH/lib/libcyaml/lib/
    cp -r $1/include/cyaml/ $PROJECT_PATH/lib/libcyaml/include/
}

build_pkgs() {
    if [ $GEN_DOCS ]; then doxygen Doxyfile; fi
    b_libcyaml $PROJECT_PATH/packages/libcyaml-1.3.1
}

if [ -z "$1" ]; then
    # Options loop
    for arg in $@; do
	if [ "$arg" == "--gen-docs" ]; then
	    GEN_DOCS=1
	fi
    done
    # Execution loop
    for arg in $@; do
	if [ "$arg" == "build" ]; then
	    build_pkgs
	    break
	fi
    done
fi
