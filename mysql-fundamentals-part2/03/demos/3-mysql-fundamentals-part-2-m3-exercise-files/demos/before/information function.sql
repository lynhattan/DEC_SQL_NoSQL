-- CHARSET() - Return the character set of the argument
SELECT CHARSET('SQLAuthority');

-- COLLATION() - Return the collation of the string argument
SELECT COLLATION('SQLAuthority');

-- CONNECTION_ID() - Return the connection ID (thread ID) for the connection
SELECT CONNECTION_ID();

-- CURRENT_USER(), CURRENT_USER	The authenticated user name and host name
SELECT CURRENT_USER(), CURRENT_USER;

-- DATABASE() OR SCHEMA() - Return the default (current) database name
USE sakila;
SELECT DATABASE(), SCHEMA();

-- USER() - The user name and host name provided by the client
SELECT USER();

-- VERSION - Returns a string that indicates the MySQL server version
SELECT VERSION();










