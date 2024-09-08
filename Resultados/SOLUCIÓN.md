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

4. Dar permisos a Ejercicio1.sh y ejecutar: 
``` chmod u+x Ejercicio1.sh ```
``` ./Ejercicio1.sh ```

5. Resultado:

![](Ejercicio_1_HDFS.png)



# EJERCICIO 2:
1. Ejecuto el contendor de la versión 2 que contiene solo Hadoop y Hive para el ejercicio 2.
``` sudo docker-compose -f docker-compose-v2.yml up -d ```

2. Modifico Paso02.hql para agregar la eliminación de la DB si existe ```DROP DATABASE IF EXITS integrador;``` y agregué un ```EXIT;``` al final para salir de HIVE.

3. Dar permisos a Ejercicio2.sh y ejecutar: 
``` chmod u+x Ejercicio2.sh ```
``` ./Ejercicio2.sh ```

4. Resultado:

![](Ejercicio_2_HDFS.png)

![](Ejercicio_2_SQL_1.png)

5. PARA VERIFICAR:
``` 
sudo docker exec -it hive-server bash
hive
SHOW DATABASES;
USE integrador;
SHOW TABLES;
SELECT COUNT(*) FROM venta;
```

![](Ejercicio_2_SQL_2.png)


# EJERCICIO 3:
1. Trabajo con la v2 del docker-compose.

2. Modifico Paso03.hql para agregar la eliminación de la DB si existe ```DROP DATABASE IF EXISTS integrador2;``` y agregué un ```EXIT;``` al final para salir de HIVE. Arreglo la línea ```REPLACE(Salario,``` , elimino todo lo que hay de la tabla trip ya que es de otro ejercicio. Creo una tabla ventas_ok con Mes y Año de tabla ventas. La particiono, e inserto los registros por cada mes.

3. Copio los datos en data2 del HDFS.

4. Dar permisos a Ejercicio3.sh y ejecutar:
``` chmod u+x Ejercicio3.sh ```
``` ./Ejercicio3.sh ```

5. Resultado:

![](Ejercicio_3_HDFS.png)




# EJERCICIO 4:
1. Trabajo con la v2 del docker-compose.

2. Dar permisos a Ejercicio4.sh y ejecutar: 
``` chmod u+x Ejercicio4.sh ```
``` ./Ejercicio4.sh ```

3. Guardo los resultados de la consulta antes de la modificación del índice (21.37 segundos).

```SELECT idsucursal, sum(precio * cantidad) FROM venta GROUP BY idsucursal;```

![](Ejercicio_4_SQL_1.png)

4. Modifico el índie:

```
CREATE INDEX index_venta_sucursal ON TABLE venta(IdSucursal) AS 'org.apache.hadoop.hive.ql.index.compact.CompactIndexHandler' WITH DEFERRED REBUILD;
ALTER INDEX index_venta_sucursal ON venta [PARTITION partition_spec] REBUILD; 
```

5. Verifico la modificación en los tiempos de la consulta original. Resultados  (3.461 segundos):

![](Ejercicio_4_SQL_2.png)



# EJERCICIO 5.1:
1. Ejecuto el contendor de la versión 3.
``` sudo docker-compose -f docker-compose-v3.yml up -d ```

2. Dar permisos a Ejercicio5.sh y ejecutar:
``` chmod u+x Ejercicio5_1.sh ```
``` ./Ejercicio5_1.sh ```

3. Archivo cargado en el HDFS:

![](Ejercicio_5_1_HDFS_1.png)


4. Resultado carga Manual de personal:

![](Ejercicio_5_1_HBase_1.png)


5. Resultado carga csv de personal y carga tabla album:

![](Ejercicio_5_1_HBase_2.png)


# EJERCICIO 5.2:
1. Dar permisos a Ejercicio5.sh y ejecutar:
``` chmod u+x Ejercicio5.sh ```
``` ./Ejercicio5.sh ```

2. Hay que modificar la idrección en iris.hql.

3. Tengo que modificar la versión de mongo del contenedor
``` image: mongo:4.0.4.```

3. Resultado carga Manual de personal:

![](Ejercicio_5_HBase_1.png)


4. Resultado carga csv de personal y carga tabla album:

![](Ejercicio_5_HBase_2.png)




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







    