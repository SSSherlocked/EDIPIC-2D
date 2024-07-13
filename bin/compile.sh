#! /bin/bash

Project_Directory=$(dirname "$(pwd)")

mkdir -p build
cd build || ! echo -e "\e[31m>> Fail to enter /build!\e[0m" || exit

# echo -e "\e[32m >> Updating from the remote repo... \e[0m "
# git pull

echo -e "\e[32m >> Compiling... \e[0m "
cmake ${Project_Directory} && make
