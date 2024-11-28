CREATE DATABASE IF NOT EXISTS openmetadata_db;
GRANT ALL PRIVILEGES ON openmetadata_db.* TO 'openmetadata_user'@'%' IDENTIFIED BY 'openmetadata_password';
FLUSH PRIVILEGES;
