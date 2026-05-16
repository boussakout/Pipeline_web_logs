sqoop import \
  --connect "jdbc:mysql://localhost/web_logs?useSSL=false" \
  --username root \
  --password root \
  --table access_logs \
  --target-dir /user/hive/warehouse/web_logs_raw \
  --direct \
  -m 1
