#!/bin/bash
# -*- Coding: UTF-8 -*-

PROJECT_PATH=`pwd`
BUILD_PKGS=0

if [ "$1" == "--build" ]; then
    $BUILD_PKGS=1
fi

# Bibliotecas necessárias
if [ BUILD_PKGS ]; then
    libcyaml_root=$PROJECT_PATH/packages/libcyaml-1.3.1
    cd $libcyaml_root
    make
    mkdir -p $PROJECT_PATH/lib/libcyaml/lib
    mkdir -p $PROJECT_PATH/lib/libcyaml/include
    cp $libcyaml_root/build/release/libcyaml.a $PROJECT_PATH/lib/libcyaml/lib/
    cp -r $libcyaml_root/include/cyaml/ $PROJECT_PATH/lib/libcyaml/include/
fi