CREATE DATABASE Contacts;
USE Contacts;

CREATE TABLE address(	address_id INTEGER NOT NULL,	address_building_number VARCHAR(55) NOT NULL,	address_street VARCHAR(55) NOT NULL,	address_locality VARCHAR(55),	address_city VARCHAR(55) NOT NULL,	address_zip_postal VARCHAR(55) NOT NULL,	address_state_province_county VARCHAR(55) NOT NULL,	address_country VARCHAR(55) NOT NULL , CONSTRAINT PK_Address PRIMARY KEY (address_id) );
CREATE TABLE email_address(	email_address_id INTEGER NOT NULL,	email_address_person_id INTEGER,	email_address VARCHAR(55) NOT NULL, CONSTRAINT PK_email_address PRIMARY KEY (email_address_id ));
CREATE TABLE person(	person_id INTEGER  NOT NULL,  person_first_name VARCHAR(55) NOT NULL,	 person_last_name VARCHAR(55) NULL,	 person_contacted_number INTEGER NOT NULL, person_date_last_contacted DATETIME NOT NULL,person_date_added DATETIME NOT NULL,  CONSTRAINT PK_person PRIMARY KEY (person_id));
CREATE TABLE person_address(	person_address_id INTEGER NOT NULL,	person_address_person_id INTEGER NOT NULL,	person_address_address_id INTEGER NOT NULL, CONSTRAINT PK_person_address PRIMARY KEY (person_address_id));
CREATE TABLE phone_number(	phone_number_id INTEGER NOT NULL,	phone_number_person_id INTEGER NOT  NULL,	phone_number VARCHAR(55) NOT NULL, CONSTRAINT PK_phone_number PRIMARY KEY (phone_number_id));

INSERT INTO address (address_id, address_building_number, address_street, address_locality, address_city, address_zip_postal, address_state_province_county, address_country) VALUES (4, '555', 'Pluralsight', NULL, 'San Francisco', '91001', 'California', 'US');
INSERT INTO address (address_id, address_building_number, address_street, address_locality, address_city, address_zip_postal, address_state_province_county, address_country) VALUES (1, '555', 'Pluralsight', NULL, 'Los Angeles', '91001', 'California', 'US');
INSERT INTO address (address_id, address_building_number, address_street, address_locality, address_city, address_zip_postal, address_state_province_county, address_country) VALUES (2, '555', 'Trainsignal', NULL, 'Toronto', '7777', 'Ontario', 'Canada');
INSERT INTO address (address_id, address_building_number, address_street, address_locality, address_city, address_zip_postal, address_state_province_county, address_country) VALUES (3, '555', 'Pluralsight', 'Boonies', 'Somewhere', '11111', 'Maine', 'US');

INSERT INTO email_address (email_address_id, email_address_person_id, email_address) VALUES (1, 1, 'jon.flanders@mail.com');
INSERT INTO email_address (email_address_id, email_address_person_id, email_address) VALUES (2, 1, 'jonf@anothermail.com');

INSERT INTO email_address (email_address_id, email_address_person_id, email_address) VALUES (4, 3, 'fritz@mail.com');
INSERT INTO email_address (email_address_id, email_address_person_id, email_address) VALUES (5, NULL, 'aaron@mail.com');

INSERT INTO person (person_id, person_first_name, person_last_name, person_contacted_number,person_date_last_contacted,person_date_added ) VALUES (1, 'Jon', 'Flanders', 5,'2013-09-14 11:43:31','2013-01-14 11:43:31');
INSERT INTO person (person_id, person_first_name, person_last_name, person_contacted_number,person_date_last_contacted,person_date_added) VALUES (2, 'Shannon', 'Ahern', 0,'2013-08-14 11:43:31','2013-02-14 11:43:31');
INSERT INTO person (person_id, person_first_name, person_last_name, person_contacted_number,person_date_last_contacted,person_date_added) VALUES (3, 'Fritz', 'Onion', 1,'2013-07-14 11:43:31','2013-03-14 11:43:31');

INSERT INTO person_address (person_address_id, person_address_person_id, person_address_address_id) VALUES (1, 1, 1);
INSERT INTO person_address (person_address_id, person_address_person_id, person_address_address_id) VALUES (3, 2, 1);
INSERT INTO person_address (person_address_id, person_address_person_id, person_address_address_id) VALUES (4, 2, 2);
INSERT INTO person_address (person_address_id, person_address_person_id, person_address_address_id) VALUES (5, 3, 3);


INSERT INTO phone_number (phone_number_id, phone_number_person_id, phone_number) VALUES (1, 1, '555-1212');
INSERT INTO phone_number (phone_number_id, phone_number_person_id, phone_number) VALUES (2, 2, '555-1213');
INSERT INTO phone_number (phone_number_id, phone_number_person_id, phone_number) VALUES (3, 3, '555-1214');
INSERT INTO phone_number (phone_number_id, phone_number_person_id, phone_number) VALUES (4, 3, '555-1215');

ALTER TABLE email_address  ADD  CONSTRAINT FK_email_address_person FOREIGN KEY(email_address_person_id)
REFERENCES person (person_id);
ALTER TABLE person_address  ADD  CONSTRAINT FK_person_address_address FOREIGN KEY(person_address_address_id)
REFERENCES address (address_id);
ALTER TABLE person_address  ADD  CONSTRAINT FK_person_address_person FOREIGN KEY(person_address_person_id)
REFERENCES person (person_id) ;
ALTER TABLE phone_number   ADD  CONSTRAINT FK_phone_number_person FOREIGN KEY(phone_number_person_id)
REFERENCES person (person_id);

