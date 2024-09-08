# Primero borro por si ya existe e hice cambios
sudo docker exec -it mongodb bash -c "
rm /data/iris.csv
rm /data/iris.json
exit
"

# Copio archivos al contenedor MongoDB
sudo docker cp Datasets/iris.csv mongodb:/data/iris.csv
sudo docker cp Datasets/iris.json mongodb:/data/iris.json

# Ejecutar un bash shell dentro del contenedor MongoDB
sudo docker exec -it mongodb bash -c "<<EOF

# Importar datos en MongoDB
mongoimport /data/iris.csv --type csv --headerline -d dataprueba -c iris_csv
mongoimport --db dataprueba --collection iris_json --file /data/iris.json --jsonArray

# Comprobar la importación de datos
    mongosh shell << EOF
use dataprueba
show collections
db.iris_csv.find()
db.iris_json.find()
EOF

# Exporto los datos de MongoDB
mongoexport --db dataprueba --collection iris_csv --fields sepal_length,sepal_width,petal_length,petal_width,species --type=csv --out /data/iris_export.csv
mongoexport --db dataprueba --collection iris_json --fields sepal_length,sepal_width,petal_length,petal_width,species --type=json --out /data/iris_export.json

EOF
"
# Copio los JARs que están en la carpeta Mongo a Hive Server
sudo docker cp /home/Mongo/mongo-hadoop-hive-2.0.2.jar hive-server:/opt/hive/lib/mongo-hadoop-hive-2.0.2.jar
sudo docker cp /home/Mongo/mongo-hadoop-core-2.0.2.jar hive-server:/opt/hive/lib/mongo-hadoop-core-2.0.2.jar
sudo docker cp /home/Mongo/mongo-hadoop-spark-2.0.2.jar hive-server:/opt/hive/lib/mongo-hadoop-spark-2.0.2.jar
sudo docker cp /home/Mongo/mongo-java-driver-3.12.11.jar hive-server:/opt/hive/lib/mongo-java-driver-3.12.11.jar

# Copiar archivo HQL y ejecutar Hive
sudo docker cp iris.hql hive-server:/opt/iris.hql
sudo docker exec -it hive-server bash -c "<< EOF
# Ejecutar script HQL en Hive
hiveserver2
chmod 777 /opt/iris.hql
hive -f /opt/iris.hql
EOF"
