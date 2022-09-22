#!/usr/bin/env python3
# -*- Coding: utf-8 -*-

import sys
import hashlib
from os import path, mkdir
from urllib import request

PKGS_LIST = {
    {
        'name': 'yaml-cpp',
        'url': 'https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.7.0.zip'
    },
    {
        'name': 'libpqxx',
        'url': 'https://github.com/jtv/libpqxx/archive/refs/tags/7.7.4.zip'
    }
}

pkgdir = './packages/'
mkdir(pkgdir)
for pkg in PKGS_LIST:
    pkgfile = pkgdir + pkg['name'] + pkg['url'].split('.')[-1]
    sha256file = pkgfile + '.sha256'

    if not path.isfile(sha256file):
        try:
            request.urlretrieve(pkg['url'], pkgfile)
        except Exception as e:
            sys.exit("Exited with err: ", e)

        # Creating sha256 hash string & file
        sha256_hash = hashlib.sha256()
        with open(pkgfile, 'rb') as f:
            for bblock in iter(lambda: f.read(4096), b""):
                sha256_hash.update(bblock)
            hashstring = sha256_hash.hexdigest()
        with open(sha256file, 'w') as f:
            f.write(hashstring)
    else:
        print("[Pkgs] ~> " + pkgfile + " já existe")
