-- Create a database named 'db' if it doesn't already exist
CREATE DATABASE IF NOT EXISTS db;

-- Create a user 'user' with a password 'pass' if the user doesn't already exist, and associate with '%'(all range IP)
CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'pass';

-- Grant all privileges on all databases and tables to user 'user' when connecting from '%'(all range ip (just for test/need change later))
GRANT ALL PRIVILEGES ON db.* TO 'user'@'%' IDENTIFIED BY 'pass';

-- Change the password of the 'root' user when connecting from 'localhost' to 'root_pass'
-- ALTER USER 'root'@'localhost' IDENTIFIED BY 'root_pass';

-- Refresh the privileges to apply the changes made
FLUSH PRIVILEGES;

