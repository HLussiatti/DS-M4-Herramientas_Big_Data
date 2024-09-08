sudo docker exec -it namenode bash -c "
    #Borro el archivo si existe
    hdfs dfs rm /hbase/data/personal.csv
    #Copio el archivo desde el Docker
    hdfs dfs -put /Datasets//personal.csv /hbase/data/personal.csv
    echo 'Archivos .csv copiados a HDFS en /hbase/data//'
"

# Ejecutar comandos HBase en el contenedor hbase-master
# Creo una tabla personal (ID 1 a 4)
sudo docker exec -it hbase-master bash -c "
    echo 'Creando la tabla persona en HBase y se coloca información manualmente, resultado: personal 4...'
    hbase shell <<EOF
    create 'personal','personal_data'
    list 'personal'
    put 'personal',1,'personal_data:name','Juan'
    put 'personal',1,'personal_data:city','Córdoba'
    put 'personal',1,'personal_data:age','25'
    put 'personal',2,'personal_data:name','Franco'
    put 'personal',2,'personal_data:city','Lima'
    put 'personal',2,'personal_data:age','32'
    put 'personal',3,'personal_data:name','Ivan'
    put 'personal',3,'personal_data:age','34'
    put 'personal',4,'personal_data:name','Eliecer'
    put 'personal',4,'personal_data:city','Caracas'
    get 'personal','4'
    EOF
"


# Ejecuto el comando ImportTsv en HBase para importar el csv en personal (ID 5 a 8)
sudo docker exec -it hbase-master bash -c "
    echo 'Importo perosnal.csv en HBase...'
    hbase org.apache.hadoop.hbase.mapreduce.ImportTsv -Dimporttsv.separator=',' -Dimporttsv.columns=HBASE_ROW_KEY,personal_data:name,personal_data:city,personal_data:age personal hdfs://namenode:9000/hbase/data/personal.csv
"

# Crear otra tabla de albums de musica
sudo docker exec -it hbase-master bash -c "
    echo 'Creando la tabla de albums...'
    hbase shell <<EOF
    create 'album','label','image'
    put 'album','label1','label:size','10'
    put 'album','label1','label:color','255:255:255'
    put 'album','label1','label:text','Family album'
    put 'album','label1','image:name','holiday'
    put 'album','label1','image:source','/tmp/pic1.jpg'
    get 'album','label1'
    EOF
"