# PASOS
1. Hice un Fork del repositorio.
2. Bajé el repositorio en mi máquina y en la máquina virtual.
``` git clone https://github.com/HLussiatti/DS-M4-Herramientas_Big_Data.git ```
3. Me ubico dentro de la carpeta creada.
``` cd DS-M4-Herramientas_Big_Data ```


# EJERCICIO 1:
1. Dento de la carpeta busco el listado de archivos:
```ls -la ```

2. Ejecuto el contendor de la versión 1 que contiene solo Hadoop para el ejercicio 1.
``` sudo docker-compose -f docker-compose-v1.yml up -d ```

3. El ejercicio pide copiar los archivos que estan ubicados en Datasets dentro del contenedor "namenode":
Este proceso se ejecuta a través del archivo Ejercicio1.sh

4. Dar permisos a Ejercicio1.sh: 
``` chmod u+x Ejercicio1.sh ```
5. Ejercutar: 
``` ./Ejercicio1.sh ```

6. Resultado:
 
![Texto alternativo](Ejercicio_1_HDFS.png)

# EJERCICIO 2:
1. Ejecuto el contendor de la versión 2 que contiene solo Hadoop y Hive para el ejercicio 2.
``` sudo docker-compose -f docker-compose-v2.yml up -d ```

2. Dar permisos a Ejercicio1.sh: 
``` chmod u+x Ejercicio2.sh ```
3. Ejercutar: 
``` ./Ejercicio2.sh ``

4. Agregué un EXIT; al final del Paso02.hql para salir de HIVE.
5. PARA VERIFICAR:
``` 
SHOW DATABASES;
USE integrador;
SHOW TABLES;
SELECT COUNT(*) FROM calendario;

# EJERCICIO 3:
1. Copio los datos en data2 del HDFS

2. Modifico el Paso03.hql (al final) para la consulta de agregación x12

2. Dar permisos a Ejercicio1.sh: 
``` chmod u+x Ejercicio3.sh ```
3. Ejercutar: 
``` ./Ejercicio3.sh ``


# Para modificiaciones en el Repo.
Actualizo el repo
```
git add .
git commit -m "mensaje"
git push
```
Bajo las modificaciones al repo alojado en el Docker.
```
git reset --hard
git pull
```







    