-- Drop the database if it already exists
DROP DATABASE IF EXISTS pet_database;

-- Create the new database
CREATE DATABASE pet_database;

-- Use the newly created database
USE pet_database;

-- Create the table to store information about pets
CREATE TABLE petPet (
    petname VARCHAR(20) PRIMARY KEY,
    owner_ VARCHAR(45),
    species VARCHAR(45),
    gender CHAR(1) CHECK (gender IN ('M', 'F')),
    birth DATE,
    death DATE
);

-- Create the table to store pet events
CREATE TABLE petEvent (
    petname VARCHAR(20),
    eventdate DATE,
    eventtype VARCHAR(15),
    remark VARCHAR(255),
    FOREIGN KEY (petname) REFERENCES petPet(petname),
    PRIMARY KEY (petname, eventdate)
);

