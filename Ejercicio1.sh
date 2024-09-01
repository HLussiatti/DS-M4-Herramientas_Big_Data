#!/bin/bash
# Primero borro por si ya existe e hice cambios
sudo docker exec -it namenode bash -c "
rm -rf /home/Datasets/
cd home
mkdir Datasets
cd Datasets
mkdir data_nvo
exit
"

# Copiar archivos desde el host al contenedor "namenode"
sudo docker cp Datasets/calendario/Calendario.csv namenode:/home/Datasets/Calendario.csv
sudo docker cp Datasets/canaldeventa/CanalDeVenta.csv namenode:/home/Datasets/CanalDeVenta.csv
sudo docker cp Datasets/cliente/Cliente.csv namenode:/home/Datasets/Cliente.csv
sudo docker cp Datasets/compra/Compra.csv namenode:/home/Datasets/Compra.csv
sudo docker cp Datasets/empleado/Empleado.csv namenode:/home/Datasets/Empleado.csv
sudo docker cp Datasets/gasto/Gasto.csv namenode:/home/Datasets/Gasto.csv
sudo docker cp Datasets/producto/Producto.csv namenode:/home/Datasets/Producto.csv
sudo docker cp Datasets/proveedor/Proveedor.csv namenode:/home/Datasets/Proveedor.csv
sudo docker cp Datasets/sucursal/Sucursal.csv namenode:/home/Datasets/Sucursal.csv
sudo docker cp Datasets/tipodegasto/TiposDeGasto.csv namenode:/home/Datasets/TiposDeGasto.csv
sudo docker cp Datasets/venta/Venta.csv namenode:/home/Datasets/Venta.csv

sudo docker cp Datasets/data_nvo/Cliente.csv namenode:/home/Datasets/data_nvo/Cliente.csv
sudo docker cp Datasets/data_nvo/Empleado.csv namenode:/home/Datasets/data_nvo/Empleado.csv
sudo docker cp Datasets/data_nvo/Producto.csv namenode:/home/Datasets/data_nvo/Producto.csv

sudo docker cp Datasets/iris.csv namenode:/home/Datasets/iris.csv
sudo docker cp Datasets/raw-flight-data.csv namenode:/home/Datasets/raw-flight-data.csv
sudo docker cp Datasets/personal.csv namenode:/home/Datasets/personal.csv


# Ejecutar comandos dentro del contenedor "namenode"
sudo docker exec -it namenode bash -c " 
    # Borro la carpeta si exite (por si hago cambios) y luego la creo en HDFS
    hdfs dfs -rm -R /data
    hdfs dfs -mkdir -p /data

    # Mover archivos .csv desde /home/Datasets a la carpeta HDFS /user/hadoop/data
    hdfs dfs -put /home/Datasets/* /data/ 
"
echo "Archivos .csv copiados a HDFS en /user/hadoop/data/" 