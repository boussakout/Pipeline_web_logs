imane@imane-VirtualBox:~/projet-big-data/scripts$ ls
1_mysql_setup.sql  2_sqoop_import.sh  3_hive_tables.hql  4_hive_queries.hql  5_hbase_schema.txt
imane@imane-VirtualBox:~/projet-big-data/scripts$ 



# Projet Big Data - Analyse des Web Logs

## Dataset
https://www.kaggle.com/datasets/eliasdabbas/web-server-access-logs

## Pipeline
MySQL -> Sqoop -> HDFS -> Hive -> HBase

## Etapes d execution

### 1. MySQL
sudo mysql -u root -p --local-infile=1
source scripts/1_mysql_setup.sql

### 2. Sqoop
bash scripts/2_sqoop_import.sh

### 3. Hive Tables
hive -f scripts/3_hive_tables.hql

### 4. Hive Requetes
hive -f scripts/4_hive_queries.hql

### 5. HBase
hbase shell
puis coller le contenu de scripts/5_hbase_schema.txt

## Structure
scripts/  -> tous les scripts
data/     -> lien dataset
rapport/  -> rapport PDF# Projet Big Data – Web Logs
