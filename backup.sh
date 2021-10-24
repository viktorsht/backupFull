#!/usr/bin/env sh 

# diretório de backup
backup_path= " A pasta que vc quer fazer o backup"

# diretório de destino
backup_path_destino= "/mnt/backup"

#formado do arquivo
date_format=$(date "+%d-%m-%Y")
final_archive="backup-$date_format.tar.gz"

#log
log_file="/var/log/daily-backup.log"


### Teste

if ! mountpoint -q -- $backup_path_destino; then
	printf "DEVICE NOT MOUNTED in: $backup_path_destino CHECK IT.\n"
	exit 1 
fi

### Inicio do backup

tar -czSpf "$backup_path_destino/$final_archive" "$backup_path"
