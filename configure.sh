#!/bin/bash
# -*- Coding: UTF-8 -*-

PROJECT_PATH = `pwd`
BUILD_PKGS = 0

if [ "$1" == "--build" ]; then
    BUILD_PKGS = 1
fi

# Bibliotecas necessárias
if [ BUILD_PKGS ]; then
    cd $PROJECT_PATH/include/libcyaml-1.3.1/
    make
fi