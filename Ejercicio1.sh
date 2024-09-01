#!/bin/bash

# Copiar archivos desde el host al contenedor "namenode"
sudo docker cp Datasets/. namenode:/home/Datasets

# Ejecutar comandos dentro del contenedor "namenode"
sudo docker exec -it namenode bash "
  
# Crear una carpeta en HDFS
 hdfs dfs -mkdir -p /data

# Mover archivos .csv desde /home/Datasets a la carpeta HDFS /user/hadoop/data
    hdfs dfs -put /home/Datasets/*.csv /data/ 

"
echo "Archivos .csv copiados a HDFS en /user/hadoop/data/" 