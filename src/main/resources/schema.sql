CREATE TABLE CUSTOMER (
    CUST_ID INT IDENTITY NOT NULL PRIMARY KEY AUTO_INCREMENT,
    CUST_EMAIL VARCHAR(100) NOT NULL,
    CUST_NAME VARCHAR(50),
    CUST_ADDRESS VARCHAR(100)
);

ALTER TABLE CUSTOMER ADD CONSTRAINT EMAIL_UNIQUE UNIQUE(CUST_EMAIL);

CREATE TABLE CRITERIA (
    ISSUE_ID INT IDENTITY NOT NULL PRIMARY KEY,
    ISSUE_TYPE VARCHAR(50) NOT NULL,
);

ALTER TABLE CRITERIA ADD CONSTRAINT ISSUE_TYPE_UNIQUE UNIQUE(ISSUE_TYPE);

CREATE TABLE TECHNICIAN (
    TECH_ID INT  NOT NULL ,
    TECH_CAPABILITY_ID INT NOT NULL,
    TECH_NAME VARCHAR(50),
    PRIMARY KEY (TECH_ID,TECH_CAPABILITY_ID)
);

ALTER TABLE TECHNICIAN
ADD CONSTRAINT FK_TECH_CAPABILITY
FOREIGN KEY (TECH_CAPABILITY_ID) REFERENCES CRITERIA(ISSUE_ID);

CREATE TABLE TECHNICIAN_AVAILABILITY_STATUS (
    TECH_ID INT  NOT NULL PRIMARY KEY,
    TECH_HOLD_STATUS VARCHAR(50)
);

CREATE TABLE RESERVATION (
	RES_ID VARCHAR(100) IDENTITY NOT NULL PRIMARY KEY,
    TECH_ID INT NOT NULL,
    ISSUE_ID INT NOT NULL,
    CUST_EMAIL VARCHAR(100) NOT NULL,
    ISSUE_WORK_STATUS VARCHAR(50),
    REQUEST_DATE TIMESTAMP DEFAULT NULL,
    COMPLETION_DATE TIMESTAMP DEFAULT NULL
);