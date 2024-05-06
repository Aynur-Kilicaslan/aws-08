#!/bin/bash
#bu script root kullanicisi olarak yada adminle calissin 
if [[ "${UID}" -ne 0 ]] #eger userid o degilse
then
    echo "lütfen root olarak gir"
    exit 1
fi 

#backuplayacagim yer
BACKUP_DIR=/mnt/backup
DIRECTORIES=("/home/ec2-user/data" "/etc" "/boot" "/usr")
#instance in hostname ini al
HOSTNAME=$(hostname -s) #-s ile sadece hostname i aldi ec2 lu yeri atti

#tarih ve saat bilgisi al(man date ten bak)
DATE=$(date +%F-%H-%M)

echo "backup lama basladi"

if [[ ! -d "BACKUP_DIR" ]]
then
  mkdir $BACKUP_DIR
fi  
#liste icindeki isimlere iteration yapioz
for DIR in "${DIRECTORIES[@]}"
do 
  FILENAME= "$BACKUP_DIR/$HOSTNAME-$DATE-$(basename $DIR).tgz"

  tar -czvf $FILENAME $DIR
  echo "yedek olustu"
done