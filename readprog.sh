#!/bin/bash

FILES=$@
for FILE in $@; do
 if [ -f $FILE ]
 then
 echo this is a regular file
 elif [ -d $FILE ]
 then
 echo this is a directory
 elif [ ! -e $FILE ]
 then
 echo the file doesnt exisit
 fi
 done
