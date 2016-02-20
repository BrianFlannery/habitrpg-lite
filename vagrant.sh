#!/bin/bash

main() {
  set -e ;
  set -x ;
  [[ -e config.json ]] || cp config.json.example config.json ;
  [[ -e Vagrantfile ]] || cp Vagrantfile.example Vagrantfile ;
  vagrant up ;
}

cd $(dirname "$0") ;
main ;

#
