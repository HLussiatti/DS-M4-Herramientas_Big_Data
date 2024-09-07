# Primero borro si ya existe para cuando hago cambios
sudo docker exec -it hive-server bash -c "
cd hive
cd scripts
rm Paso02.hql
cd ..
cd ..
"

# Copio el hql al contenedor
sudo docker cp Paso02.hql hive-server:/opt/hive/scripts/Paso02.hql

# Elimino todas las tablas por si ya existe la base de datos.
sudo docker exec -it hive-server bash -c "
hive -e "USE integrador; SHOW TABLES;" | while read table; do
    hive -e "DROP TABLE integrador.$table;"
done
"

# Ejecuto el hql desde el contenedor
sudo docker exec -it hive-server bash -c "hive -f /opt/hive/scripts/Paso02.hql"
