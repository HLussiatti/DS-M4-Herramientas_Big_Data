# Copio el hql al contenedor
sudo docker cp Paso04.hql hive-server:/opt/hive/scripts/Paso04.hql
# Ejecuto el contenedor
sudo docker exec -it hive-server bash -c "hive -f /opt/hive/scripts/Paso04.hql"


