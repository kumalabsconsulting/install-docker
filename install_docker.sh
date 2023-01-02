#!/bin/bash
# Simple script from Docker documentation
# Add some extrat stuff
# Author: J.CUADRADO <kumalabsconsulting> <redbeard28>


#### Function
docker_install_by_root () {
  MYUSER=$1
  apt-get remove docker docker-engine docker.io containerd runc

  echo "Installing prerequisits..."
  apt-get update
  apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    virt-what
  echo "Checking what type of host..."
  HOST_TYPE=`virt-what`
  if [[ "$HOST_TYPE" == 'lxc' ]];then
	  echo "You are installing Docker on a $HOST_TYPE type"
	  mkdir -p /etc/apt/keyrings
	  curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
    apt-get update
    apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
    usermod -a -G docker $MYUSER
  fi
}

docker_install_by_others () {
  MYUSER=$1
  sudo apt-get remove docker docker-engine docker.io containerd runc

  echo "Installing prerequisits..."
  sudo apt-get update
  sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    virt-what
  echo "Checking what type of host..."
  HOST_TYPE=`virt-what`
  if [[ "$HOST_TYPE" == 'lxc' ]];then
	  echo "You are installing Docker on a $HOST_TYPE type"
	  sudo mkdir -p /etc/apt/keyrings
	  curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
    sudo usermod -a -G docker $MYUSER
  fi
}


## MAIN
## Check if Debian OS
if test -r /etc/os-release
  then
	ID=`awk -F= '$1=="ID" { print $2 ;}' /etc/os-release`
	VERSION=`awk -F= '$1=="VERSION" { print $2 ;}' /etc/os-release`
else
  echo "Don't know what os-type it is !"
  exit 1
fi

echo "ID is $ID"
if [[ "$ID" == 'debian' ]];then
  echo $ID
# Actions for Debian OS
  if [[ "$EUID" -ne 0 ]];then

    if [[ `which sudo` -ne 0 ]];then
  	  echo "There is no sudo command, please install..."
      exit 1
    fi
  else
    docker_install_by_root "$1"
  fi
elif [[ "$ID" == 'ubuntu' ]];then
  sudo apt-get update
  sudo apt-get install -y snapd
  sudo snap install docker
else
  echo "This script is usefull for debian/ubuntu os"
  exit 1
fi