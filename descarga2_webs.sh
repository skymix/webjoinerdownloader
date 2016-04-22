##########################################################################
# descarga2_web 
# bash script to creates a sort of urls to webdownload reading the
# URLS from two localfiles
#
# Expects:      
#        Filename 1 as parameter
#        Filebame 2 as parameter
#        WEB Variable if want to download 
#
# Copyright (C) 2016 Jose Angel Diaz Diaz
# skymix.es@gmail.com 04/2016
# This program is free software: you can redistribute 
#it and/or modify it under the terms of the GNU General 
#Public License as published by the Free Software Foundation,
#either version 3 of the License, or (at your option) any later version.
#
#This program is distributed in the hope that it will be useful, 
#but WITHOUT ANY WARRANTY; without even the implied warranty of 
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
#See the GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public 
#License along with this program. If not, see http://www.gnu.org/licenses/.
#
############################################################################




#!/bin/bash
IDARCHIVO=$1
FILEARCHIVO=$2

WEB="URL_FILE"

if [ -z $1 ] ; then
    echo "falta el archivo"
else
IFS=$'\r\n' GLOBIGNORE='*' command eval  'num=($(cat $IDARCHIVO))'
IFS=$'\r\n' GLOBIGNORE='*' command eval  'name=($(cat $FILEARCHIVO))'
  
# Mostramos los numeros en el array
#printf "%s\n" "${num[*]}"
#echo ${num[*]}

#printf "%s\n" "${name[*]}"
#echo ${name[*]}

#echo ${num[1]}
#echo ${name[1]}


#Descargamos de la web de forja los ficheros
#wget -k -p http://content.php?id=$id
for id in $(seq 0 266); do
#wget -k -p --no-check-certificate "$WEB/223/${num[$id]}/${name[$id]}"
printf "%s\n" "$WEB/${num[$id]}/${name[$id]}"
done

fi
