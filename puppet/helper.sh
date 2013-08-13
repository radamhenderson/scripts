#!/bin/sh

input=input
output=output


cat ./$input | while read line 
do


echo "file { '$line' :" >>output
echo "  mode    => '0644'," >>output
echo "  source  => 'puppet:///modules/users$line',">>output
echo "  require => File['/home'],">>output
echo "}" >>output
echo "" >>output

done
