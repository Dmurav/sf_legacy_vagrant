#!/usr/bin/env bash


bootstrap() {

  echo "Start installation!"

  sudo apt-get install make
  sudo apt-get install gcc
  sudo apt-get install libreadline6 libreadline6-dev
  sudo apt-get install zlib1g-dev
  sudo apt-get install bison

  #Download postgres
  wget https://ftp.postgresql.org/pub/source/v8.4.22/postgresql-8.4.22.tar.gz
  tar xfz postgresql-8.4.22.tar.gz
  cd postgresql-8.4.22

  #Installation
  ./configure
  make
  sudo su
  make install
  useradd -m -p postgres -s /bin/bash postgres
  mkdir /usr/local/pgsql/data
  chown postgres /usr/local/pgsql/data
  chown postgres /home
  sudo su postgres
  /usr/local/pgsql/bin/initdb -D /usr/local/pgsql/data
  /usr/local/pgsql/bin/postgres -D /usr/local/pgsql/data >logfile 2>&1 &

  echo "DONE! ENJOY, br0!"

}

bootstrap