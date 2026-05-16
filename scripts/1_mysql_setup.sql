CREATE DATABASE IF NOT EXISTS web_logs;
USE web_logs;
DROP TABLE IF EXISTS access_logs;
CREATE TABLE access_logs (log_line TEXT);
LOAD DATA LOCAL INFILE '/home/imane/projet-big-data/data/access.log'
INTO TABLE access_logs
FIELDS TERMINATED BY '\n'
LINES TERMINATED BY '\n'
(log_line);
