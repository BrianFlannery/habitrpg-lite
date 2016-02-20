#!/bin/bash

cd ;
cd habitrpg || cd habitrpg-lite ;

nohup npm start &> out.log & echo "'npm start' is running in the background" ;
sleep 1 ;

#

