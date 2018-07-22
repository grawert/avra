#!/bin/sh

PKG_NAME=avra-install.pkg
IDENTIFIER=org.nobody.pkg.avra

INSTALL_ROOT_DIR=install_root
INSTALL_BIN_DIR=$INSTALL_ROOT_DIR/usr/local/bin/
INSTALL_DOC_DIR=$INSTALL_ROOT_DIR/usr/local/share/doc/avra/

pushd src
make -f makefiles/Makefile.osx
popd

mkdir $INSTALL_ROOT_DIR
mkdir -p $INSTALL_BIN_DIR
mkdir -p $INSTALL_DOC_DIR

cp src/avra $INSTALL_BIN_DIR
cp doc/*.txt $INSTALL_DOC_DIR

pkgbuild --root $INSTALL_ROOT_DIR --identifier $IDENTIFIER $PKG_NAME

rm -rf $INSTALL_ROOT_DIR
rm -f src/avra
