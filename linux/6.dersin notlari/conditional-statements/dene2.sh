#!/bin/bash
read -p "Adinizi girin:" isim
read -p "yasinizi girin:" yas
read -p "Kac yasa kadar yasarsin:" salla

if [[ $yas -lt 18 ]]
then
echo "henuz ogrencisin  $(( 18 - $yas )) yil sonra calisacaksin"

elif [[ $yas -gt 18 ]] && [[ $yas -lt 65 ]]
then
echo "iscisin  $(( 65 - $yas )) yil sonra emekli olacaksin"

elif [[ $yas -gt 65 ]]
then
  if [[ $yas -lt salla ]]
  then
   echo "emeklisin  $(( $salla - $yas )) yil daha yasayacaksin"
  
  else
   echo "Allah rahmet eylesin"
  fi

fi 
