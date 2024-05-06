#!/bin/bash

# Yedeklenecek dizinlerin listesi
backup_dirs=("/home/ec2-user/data" "/etc" "/boot" "/usr")

# Yedeklerin kaydedileceği klasör
backup_folder="/mnt/backup"

# Host adını al
host=$(hostname)

# Tarih ve saat bilgisini al
date_time=$(date +'%Y%m%d-%H%M%S')

# Her bir dizin için yedekleme işlemi yap
for dir in "${backup_dirs[@]}"; do
    # Yedek dosya adını oluştur
    backup_file="$backup_folder/$host-$date_time-$(basename $dir).tgz"

    # Dizin yedekleme işlemi
    tar -czf "$backup_file" "$dir"

    echo "Yedek oluşturuldu: $backup_file"
done
