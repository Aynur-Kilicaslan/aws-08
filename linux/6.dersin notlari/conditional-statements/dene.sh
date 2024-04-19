#!/bin/bash
read -p "dosya ismi gir " file_name
if [-e "$file_name" ]
then
  echo "bu dosya zaten var"
else
  touch "$file_name"
  echo "dosya yaratildi"
fi
