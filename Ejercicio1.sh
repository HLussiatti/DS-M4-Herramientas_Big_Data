#!/bin/bash

# Copiar archivos desde el host al contenedor "namenode"


sudo docker cp Datasets/calendario/Calendario.csv namenode:/home/Datasets/calendario/Calendario.csv
sudo docker cp Datasets/canaldeventa/CanalDeVenta.csv namenode:/home/Datasets/canaldeventa/CanalDeVenta.csv
sudo docker cp Datasets/cliente/Cliente.csv namenode:/home/Datasets/cliente/Cliente.csv
sudo docker cp Datasets/compra/Compra.csv namenode:/home/Datasets/compra/Compra.csv
sudo docker cp Datasets/empleado/Empleado.csv namenode:/home/Datasets/empleado/Empleado.csv
sudo docker cp Datasets/gasto/Gasto.csv namenode:/home/Datasets/gasto/Gasto.csv
sudo docker cp Datasets/producto/Producto.csv namenode:/home/Datasets/producto/Producto.csv
sudo docker cp Datasets/proveedor/Proveedor.csv namenode:/home/Datasets/proveedor/Proveedor.csv
sudo docker cp Datasets/sucursal/Sucursal.csv namenode:/home/Datasets/sucursal/Sucursal.csv

sudo docker cp Datasets/tipodegasto/TiposDeGasto.csv namenode:/home/Datasets/tipodegasto/TiposDeGasto.csv
sudo docker cp Datasets/venta/Venta.csv namenode:/home/Datasets/venta/Venta.csv

sudo docker cp Datasets/data_nvo/Cliente.csv namenode:/home/Datasets/data_nvo/Cliente.csv
sudo docker cp Datasets/data_nvo/Empleado.csv namenode:/home/Datasets/data_nvo/Empleado.csv
sudo docker cp Datasets/data_nvo/Producto.csv namenode:/home/Datasets/data_nvo/Producto.csv

sudo docker cp Datasets/.csv namenode:/home/Datasets

# Ejecutar comandos dentro del contenedor "namenode"
sudo docker exec -it namenode bash -c " 
    # Crear una carpeta en HDFS
    hdfs dfs -rm -R /data
    hdfs dfs -mkdir -p /data

    # Mover archivos .csv desde /home/Datasets a la carpeta HDFS /user/hadoop/data
    hdfs dfs -put /home/Datasets/* /data/ 
"
echo "Archivos .csv copiados a HDFS en /user/hadoop/data/" 