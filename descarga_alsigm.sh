##########################################################################
# descarga_web 
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
FILEARCHIVO=$2
WEB="http://URL"

if [ -z $1 ] ; then
    echo "falta el archivo"
else

  num=( $(<$IDARCHIVO) )
  name=( $(<$FILEARCHIVO) )
  numlen=${#num[*]}
  namelen=${#name[*]}
  # Almacenamos
  x=$numlen
  y=$namelen
  temp=0

  #Metemos en Array
  while [ $x -gt 0 ]; do
        i=0
        while [ $i -lt $[$numlen-1] ]; do
            j=$[$i+1]
            if [ ${num[i]} -gt ${num[j]} ]
              then
                temp=${num[i]}
                temp2=${name[i]}
                num[i]=${num[j]}
                name[i]=${name[j]}
                num[j]=$temp
                name[j]=$temp2
            fi
            i=$j
        done
        x=$[$x-1]
   done
# Mostramos los numeros en el array
printf "%s\n" "${num[*]}"
#echo ${num[*]}
printf "%s\n" "${name[*]}"
#echo ${name[*]}
echo ${num[1]}
echo ${name[1]}
#Descargamos de la web de forja los ficheros
#wget -k -p http://content.php?id=$id
#for id in $(seq 0 266); do
#  wget -k -p --no-check-certificate $WEB/${num[$id]}
#done

fi
