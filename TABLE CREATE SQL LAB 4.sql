USE ECOMMERCE;
 ########## CREATE TABLES 
 ## SUPPLIER 
CREATE TABLE IF NOT EXISTS SUPPLIER(
	SUPP_ID INT PRIMARY KEY,
    SUPP_NAME VARCHAR(50) NOT NULL,
    SUPP_CITY VARCHAR(50) NOT NULL,
    SUPP_PHONE VARCHAR(50) NOT NULL
);

## CUSTOMER
CREATE TABLE IF NOT EXISTS CUSTOMER(
CUS_ID INT PRIMARY KEY,
CUS_NAME VARCHAR(20) NOT NULL,
CUS_PHONE VARCHAR(10) NOT NULL,
CUS_CITY VARCHAR(30) NOT NULL,
CUS_GENDER CHAR
);

## CATEGORY
CREATE TABLE IF NOT EXISTS CATEGORY(
CAT_ID INT PRIMARY KEY,
CAT_NAME VARCHAR(20) NOT NULL
);

## PRODUCT 
CREATE TABLE IF NOT EXISTS PRODUCT(
PRO_ID INT PRIMARY KEY,
PRO_NAME VARCHAR(20) NOT NULL DEFAULT "DUMMY",
PRO_DESC VARCHAR(60),
CAT_ID INT,
FOREIGN KEY (CAT_ID) REFERENCES CATEGORY(CAT_ID)
);

## SUPPLIER PRICING 
CREATE TABLE IF NOT EXISTS SUPPLIER_PRICING(
PRICING_ID INT PRIMARY KEY,
PROD_ID INT,
SUPP_ID INT,
SUPP_PRICE INT DEFAULT 0,
FOREIGN KEY (PROD_ID) REFERENCES PRODUCT(PRO_ID),
FOREIGN KEY (SUPP_ID) REFERENCES SUPPLIER(SUPP_ID)
);

## ORDER
CREATE TABLE
    IF NOT EXISTS `ORDER` (
        ORD_ID INT NOT NULL,
        ORD_AMOUNT INT NOT NULL,
        ORD_DATE DATE,
        CUS_ID INT NOT NULL,
        PRICING_ID INT NOT NULL,
        PRIMARY KEY (ORD_ID),
        FOREIGN KEY (CUS_ID) REFERENCES CUSTOMER (CUS_ID),
        FOREIGN KEY (PRICING_ID) REFERENCES SUPPLIER_PRICING (PRICING_ID)
    );
    
## RATING
CREATE TABLE
    IF NOT EXISTS rating (
        RAT_ID INT NOT NULL,
        ORD_ID INT NOT NULL,
        RAT_RATSTARS INT NOT NULL,
        PRIMARY KEY (RAT_ID),
        FOREIGN KEY (ORD_ID) REFERENCES `order` (ORD_ID)
    );   




