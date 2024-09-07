
# Primero borro si ya existe para cuando hago cambios
sudo docker exec -it hive-server bash -c "
cd hive
cd scripts
rm Paso03.hql
cd ..
cd ..
"

# el Paso03.hql necesita sacar los datos de una carpeta /data2/ del HDFS
# Ejecutar comandos dentro del contenedor "namenode"

sudo docker exec -it namenode bash -c " 
    # Borro la carpeta si exite (por si hago cambios) y luego la creo en HDFS
    hdfs dfs -rm -R /data2
    hdfs dfs -mkdir -p /data2
    exit
"
echo "Archivos .csv copiados a HDFS en /user/hadoop/data2/" 

# Copio el hql al contenedor
sudo docker cp Paso03.hql hive-server:/opt/hive/scripts/Paso03.hql


# Elimino todas las tablas por si ya existe la base de datos.
sudo docker exec -it hive-server bash -c '
hive -e "USE integrador2; SHOW TABLES;" | while read table; do
    hive -e "DROP TABLE integrador2.$table;"
done
'

# Ejecuto el contenedor
sudo docker exec -it hive-server bash -c "hive -f /opt/hive/scripts/Paso03.hql"

