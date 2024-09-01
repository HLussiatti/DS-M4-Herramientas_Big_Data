# el Paso03.hql necesita sacar los datos de una carpeta /data2/ del HDFS
# Ejecutar comandos dentro del contenedor "namenode"

sudo docker exec -it namenode bash -c " 
    # Borro la carpeta si exite (por si hago cambios) y luego la creo en HDFS
    hdfs dfs -rm -R /data2
    hdfs dfs -mkdir -p /data2

    # Mover archivos .csv desde /home/Datasets a la carpeta HDFS /user/hadoop/data
    hdfs dfs -put /home/Datasets/* /data2/ 

"
echo "Archivos .csv copiados a HDFS en /user/hadoop/data2/" 

# Salgo del Docker de Hadoop
sudo docker exec -it namenode bash -c "exit"

# Copio el hql al contenedor
sudo docker cp Paso03.hql hive-server:/opt/hive/scripts/Paso03.hql

# Ejecuto el contenedor
sudo docker exec -it hive-server bash
# Ejecuto el hql desde el contenedor
hive -f /opt/hive/scripts/Paso03.hql
# Salgo del contenedor
sudo docker exec -it hive-server bash -c "exit"