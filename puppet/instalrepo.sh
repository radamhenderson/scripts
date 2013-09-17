#!/bin/sh 


cat /etc/issue | grep Fedora
fedora=$?
cat /etc/issue | grep CentOS
centos=$?

if [ $fedora -eq 0 ]
then
  release=`cat /etc/issue | grep Fedora | awk {'{split($0, a, " "); print a[3]}'}`

  if [ $release -eq 17 ]
  then
    rpm -ivh http://yum.puppetlabs.com/fedora/f17/products/i386/puppetlabs-release-17-7.noarch.rpm
  elif [ $release -eq 18 ]
  then
    rpm -ivh http://yum.puppetlabs.com/fedora/f18/products/i386/puppetlabs-release-18-7.noarch.rpm
  elif [ $release -eq 19 ]
  then
    rpm -ivh http://yum.puppetlabs.com/fedora/f19/products/i386/puppetlabs-release-19-2.noarch.rpm
  fi

elif [ $centos -eq 0 ]
then

  release=`cat /etc/issue | grep CentOS | awk {'{split($0, a, " "); print a[3]}'}`
  if  [ $release -gt 5 ]
  then 
    rpm -ivh http://yum.puppetlabs.com/el/6/products/i386/puppetlabs-release-6-7.noarch.rpm
  else 
    rpm -ivh http://yum.puppetlabs.com/el/5/products/i386/puppetlabs-release-5-7.noarch.rpm
  fi

else

  distributor=`lsb_release -a | grep 'Distributor ID' | awk '{print substr($0, index($0, ":")+1)}' | awk '{gsub(" |\t",""); print}'`
  release=`lsb_release -a | grep 'Release' | awk '{print substr($0, index($0, ":")+1)}' | awk '{gsub(" |\t",""); print}'`


  if [ "$distributor" = "RedHatEnterpriseServer" ]
  then
    if [[ $release == 5.* ]]
    then 
      rpm -ivh http://yum.puppetlabs.com/el/5/products/i386/puppetlabs-release-5-7.noarch.rpm
    elif [[ $release == 6.* ]]
    then
      rpm -ivh http://yum.puppetlabs.com/el/6/products/i386/puppetlabs-release-6-7.noarch.rpm
    fi
  fi
  
  if [ "$distributor" = "Ubuntu" ]
  then
  echo ub
  fi
fi

