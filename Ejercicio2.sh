# Copio el hql al contenedor
sudo docker cp Paso02.hql hive-server:/opt/hive/scripts/Paso02.hql
# Ejecuto el contenedor
sudo docker exec -it hive-server bash
# Ejecuto el hql desde el contenedor
hive -f /opt/hive/scripts/Paso02.hql
# Salgo del contenedor
hive -e "exit;"