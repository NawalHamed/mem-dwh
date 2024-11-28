-- Create the openmetadata_db database if it doesn't exist
CREATE DATABASE IF NOT EXISTS openmetadata_db;

-- Create the user 'openmetadata_user' with a secure password
CREATE USER IF NOT EXISTS 'openmetadata_user'@'%' IDENTIFIED BY 'openmetadata_password';

-- Grant all privileges on the openmetadata_db database to openmetadata_user
GRANT ALL PRIVILEGES ON openmetadata_db.* TO 'openmetadata_user'@'%';

-- Apply the changes to ensure the permissions are active
FLUSH PRIVILEGES;

-- Optional: Verify the privileges
SHOW GRANTS FOR 'openmetadata_user'@'%';
