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

![](Ejercicio_1_HDFS.png)



# EJERCICIO 2:
1. Ejecuto el contendor de la versión 2 que contiene solo Hadoop y Hive para el ejercicio 2.
``` sudo docker-compose -f docker-compose-v2.yml up -d ```

2. Modifico Paso02.hql para agregar la eliminación de la DB si existe ```DROP DATABASE IF EXITS integrador;``` y agregué un ```EXIT;``` al final para salir de HIVE.

3. Dar permisos a Ejercicio1.sh: 
``` chmod u+x Ejercicio2.sh ```

4. Ejercutar: 
``` ./Ejercicio2.sh ```

5. Resultado:

![](Ejercicio_2_HDFS.png)

![](Ejercicio_2_SQL_1.png)

6. PARA VERIFICAR:
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
1. Ejecuto el contendor de la versión 3.
``` sudo docker-compose -f docker-compose-v3.yml up -d ```

2. Modifico Paso03.hql para agregar la eliminación de la DB si existe ```DROP DATABASE IF EXISTS integrador2;``` y agregué un ```EXIT;``` al final para salir de HIVE. Arreglo la línea ```REPLACE(Salario,``` , elimino todo lo que hay de la tabla trip ya que es de otro ejercicios.

3. Copio los datos en data2 del HDFS y creo una carpeta /data2/venta/ventas_part para almacenar la partición de ventas.

4. Dar permisos a Ejercicio3.sh: 
``` chmod u+x Ejercicio3.sh ```

3. Ejercutar: 
``` ./Ejercicio3.sh ```




# EJERCICIO 4:
1. Trabajo con la v2 del docker-compose.

2. Dar permisos a Ejercicio4.sh: 
``` chmod u+x Ejercicio4.sh ```

3. Ejercutar: 
``` ./Ejercicio4.sh ```

2. Guardo los resultados de la consulta antes de la modificación del índice.
```SELECT idsucursal, sum(precio * cantidad) FROM venta GROUP BY idsucursal;```

3. Modifico el índie:

```
CREATE INDEX index_venta_sucursal ON TABLE venta(IdSucursal) AS 'org.apache.hadoop.hive.ql.index.compact.CompactIndexHandler' WITH DEFERRED REBUILD;
ALTER INDEX index_venta_sucursal ON venta [PARTITION partition_spec] REBUILD; 
```

4. Verifico la modificación en los tiempos de la consulta original. Resultados:
![](Ejercicio_4_SQL.png)




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







    