CREATE DATABASE IF NOT EXISTS web_logs_db;
USE web_logs_db;

CREATE EXTERNAL TABLE IF NOT EXISTS logs_raw (
    log_line STRING
)
STORED AS TEXTFILE
LOCATION '/user/hive/warehouse/web_logs_raw';

CREATE TABLE IF NOT EXISTS logs_struct AS
SELECT
  regexp_extract(log_line, '^(\\S+)', 1) AS ip,
  regexp_extract(log_line, '\\[(.*?)\\]', 1) AS date_time,
  regexp_extract(log_line, '"(GET|POST|HEAD|PUT|DELETE|OPTIONS) ', 1) AS methode,
  regexp_extract(log_line, '"(?:GET|POST|HEAD|PUT|DELETE|OPTIONS) (\\S+)', 1) AS url,
  cast(regexp_extract(log_line, '" (\\d{3}) ', 1) AS INT) AS code_http,
  cast(regexp_extract(log_line, '" \\d{3} (\\d+)', 1) AS INT) AS taille
FROM logs_raw
WHERE regexp_extract(log_line, '^(\\S+)', 1) != '';
