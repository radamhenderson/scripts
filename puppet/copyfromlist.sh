#!/bin/sh  -x


input=tmp
output=/home/radamhenderson/papajohns/spm/modules/usrlocalbin/files


cat $input | while read line 
do

  if [ ! -e $line ]
  then
    echo "DNE $line"
  fi

  if [ -d $line ]
  then
    echo dir
  elif [ -f $line ]
  then 
 
    running=""
    paths=`echo $line | tr "/" " "`
    for x in $paths
    do

      running="$running/$x"

      if [ -e "$output/$running" ]
      then
        echo exists
      elif [ -d ./$running ]
      then
        echo "making $output/$running"
        mkdir $output/$running
      fi

    done

    cp $line $output/$line
  fi


done
