CREATE DATABASE Rtt;
Go;

create table Contacts
(
    ID int IDENTITY(1,1) primary key not null,
    TITLE varchar(50) not null,
    FIRST_NAME varchar(50) not null,
    INITIALS varchar(50) not null,
    LAST_NAME varchar(50) not null,
    EMAIL varchar(50) not null,
    TELH varchar(13) not null,
    TELW varchar(13) not null,
    MOBILE varchar(13) not null,
    POSTAL_ADDRESS_1 varchar(100) not null,
    POSTAL_ADDRESS_2 varchar(100) not null,
    POSTAL_SUBURB varchar(100) not null,
    POSTAL_CODE varchar(4) not null,
    STREET_ADDRESS_1 varchar(100) not null,
    STREET_ADDRESS_2 varchar(100) not null,
    SUBURB varchar(50) not null,
    CITY varchar(50) not null,
    STREET_CODE varchar(50) not null,
    COUNTRY varchar(50) not null
)

