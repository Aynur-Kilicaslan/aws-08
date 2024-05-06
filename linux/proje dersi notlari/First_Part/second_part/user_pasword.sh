#!/bin/bash
#root olarak userID yi gor 0 cikiyor
if [[ "${UID}" -ne 0 ]] #eger userid o degilse
then
  echo "lütfen root olarak gir"
  exit 1
fi  

read -p "kullanici adi gir:" USER_NAME

read -p "kullanicin kim tanimla:" DESCRIPTION

read -sp "parola gir:" PASSWORD

useradd -c "${DESCRIPTION}" -m "${USER_NAME}" 2> /dev/null

if [[ "${?}" -ne 0 ]]
then
  echo "bu kullanici adi yaten var,lütfen baska bitane dene"
  exit 1
fi
#man passwd den bak ne kulanacagina

echo ${PASSWORD} | passwd --stdin ${USER_NAME}

if [[ "${?}" -ne 0 ]]
then
  echo "The password for the account couldn't be set."
  exit 1
fi
passwd -e $USER_NAME

echo
echo "Username: $USER_NAME" 
echo
echo "Password: $PASSWORD"