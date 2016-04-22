##########################################################################
# descarga3_web 
# bash script to download from web reading the
# URLS from a local file
#
# Expects:      
#        Filename as parameter
#       
#
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
if [ -z $1 ] ; then
    echo "falta el archivo"
else
#Cambiamos el IFS global y cargamos el fichero
  IFS=$'\r\n' GLOBIGNORE='*' command eval  'num=($(cat $IDARCHIVO))'
  
# Mostramos los elementos en el array
#printf "%s\n" "${num[*]}"
#echo ${num[*]}


#echo ${num[1]}


#Descargamos de la web de forja los ficheros
#wget -k -p http://content.php?id=$id
for id in $(seq 0 266); do
printf "Descargando fichero ID:\n"
printf "%s\n" "${num[$id]}"

wget --no-check-certificate "${num[$id]}"

done

fi
