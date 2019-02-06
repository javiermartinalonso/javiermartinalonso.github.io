ruta="/srv/datos/backups_BBDD"
nombre=`hostname`
dia=$(date +"%Y-%m-%d_%H_%M")
pg_dump -h 127.0.0.1 -p 5432 --format=c -d $1 -v  -U postgres --file=$ruta/pg_dump_$1_$dia.dmp > $ruta/pg_dump_$1_$dia.log 2>&1

