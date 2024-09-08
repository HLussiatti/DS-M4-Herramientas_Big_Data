sudo docker exec -it namenode bash -c "
	hdfs dfs -mv /data/personal.csv /hbase/data/personal.csv
    "

sudo docker exec -it hbase-master hbase bash -c " 
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

    hbase org.apache.hadoop.hbase.mapreduce.ImportTsv -Dimporttsv.separator=',' -Dimporttsv.columns=HBASE_ROW_KEY,personal_data:name,personal_data:city,personal_data:age personal hdfs://namenode:9000/hbase/data/personal.csv
    
    scan 'personal'
    
    create 'album','label','image'
    put 'album','label1','label:size','10'
    put 'album','label1','label:color','255:255:255'
    put 'album','label1','label:text','Family album'
    put 'album','label1','image:name','holiday'
    put 'album','label1','image:source','/tmp/pic1.jpg'
    get 'album','label1'
    "