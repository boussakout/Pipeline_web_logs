USE web_logs_db;

-- 1. Nombre total de requêtes
SELECT COUNT(*) AS total_requetes FROM logs_struct;

-- 2. Répartition par code HTTP
SELECT code_http, COUNT(*) AS nb
FROM logs_struct
GROUP BY code_http
ORDER BY nb DESC;

-- 3. Top 10 URLs les plus demandées
SELECT url, COUNT(*) AS nb
FROM logs_struct
GROUP BY url
ORDER BY nb DESC
LIMIT 10;

-- 4. Top 10 IPs les plus actives
SELECT ip, COUNT(*) AS nb
FROM logs_struct
GROUP BY ip
ORDER BY nb DESC
LIMIT 10;

-- 5. Taux d erreurs
SELECT
  SUM(CASE WHEN code_http >= 400 THEN 1 ELSE 0 END) AS erreurs,
  COUNT(*) AS total,
  ROUND(SUM(CASE WHEN code_http >= 400 THEN 1 ELSE 0 END)*100.0/COUNT(*), 2) AS taux_erreur
FROM logs_struct;

-- 6. Trafic par heure
SELECT substr(date_time, 13, 2) AS heure, COUNT(*) AS nb
FROM logs_struct
GROUP BY substr(date_time, 13, 2)
ORDER BY heure;

-- 7. Top URLs en erreur 404
SELECT url, COUNT(*) AS nb
FROM logs_struct
WHERE code_http = 404
GROUP BY url
ORDER BY nb DESC
LIMIT 10;

-- 8. IPs générant le plus d erreurs
SELECT ip, COUNT(*) AS nb_erreurs
FROM logs_struct
WHERE code_http >= 400
GROUP BY ip
ORDER BY nb_erreurs DESC
LIMIT 10;

-- 9. Répartition GET vs POST
SELECT methode, COUNT(*) AS nb
FROM logs_struct
GROUP BY methode
ORDER BY nb DESC;

-- 10. Volume transféré par ressource
SELECT url, SUM(taille) AS volume_total
FROM logs_struct
GROUP BY url
ORDER BY volume_total DESC
LIMIT 10;

-- 11. Trafic réussi vs erreur
SELECT
  SUM(CASE WHEN code_http < 400 THEN 1 ELSE 0 END) AS succes,
  SUM(CASE WHEN code_http >= 400 THEN 1 ELSE 0 END) AS erreurs
FROM logs_struct;

-- 12. IPs suspectes plus de 500 requêtes
SELECT ip, COUNT(*) AS nb
FROM logs_struct
GROUP BY ip
HAVING nb > 500
ORDER BY nb DESC;
