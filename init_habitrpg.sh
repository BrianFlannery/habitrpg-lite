#!/bin/bash

cd ;

pubIp=`curl -s http://169.254.169.254/latest/meta-data/public-ipv4` ;
x=`egrep "$pubIp" /etc/hosts` ;
[[ $x ]] || echo -e "\n$pubIp $(hostname -s) $(hostname -f) $(hostname)" | sudo tee -a /etc/hosts ;

x=`sudo apt-key list | grep EA312927` ;
[[ $x ]] || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927

[[ -e /etc/apt/sources.list.d/mongodb-org-3.2.list ]] || echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

sudo apt-get update

sudo apt-get install -y mongodb-org

sudo service mongod start

sudo apt-get update

cmd="umask 022 ; apt-get install -y build-essential ;" ;
cmd="$cmd ; apt-get install -y python-software-properties ; apt-add-repository ppa:chris-lea/node.js ;" ;
cmd="$cmd apt-get update ; apt-get install -y nodejs git" ; 
sudo bash -c "$cmd" ;

sudo bash -c "umask 022 ; npm install -g gulp grunt-cli bower" ;
me=`id -un` ;
[[ $HOME ]] || export HOME=$(cd ; pwd) ;
[[ -e habitrpg-lite ]] || git clone https://github.com/BrianFlannery/habitrpg-lite.git ;

cd habitrpg-lite ;

git checkout develop ;

sudo chown -R $me $HOME/.npm ;

npm install ;

#
