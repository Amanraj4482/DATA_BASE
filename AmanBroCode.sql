CREATE DATABASE MYDBMS;
USE MYDBMS;
DROP DATABASE MYDBMS;

CREATE DATABASE MYDBMS1;
USE MYDBMS1;

USE AMITDB;
DROP DATABASE AMITDB;

# TO MAKE DATA BASE READ ONLY MODE WE CAN'T MAKE MODIFICATIONS TO IT
ALTER DATABASE mydbms1 READ ONLY =1;
#TO DISABLE IT 
ALTER DATABASE MYDBMS1 READ ONLY =0;

DROP DATABASE MYDBMS1;
CREATE DATABASE DB;
USE DB;

CREATE TABLE EMP(
	emp_id INT,
	first_name VARCHAR(40),
	last_name VARCHAR(50),
	hourly_pay DECIMAL(5,3),
	hire_day DATE
    );
    
    
SELECT * FROM EMP;

RENAME TABLE EMP TO WORKERS;
RENAME TABLE WORKERS TO EMP;


ALTER TABLE EMP
ADD PHONE_NUMBER VARCHAR(15);

SELECT * FROM EMP;


ALTER TABLE EMP 
RENAME COLUMN PHONE_NUMBER TO EMAIL;

ALTER TABLE EMP
MODIFY COLUMN EMAIL VARCHAR(100);


ALTER TABLE EMP
MODIFY EMAIL VARCHAR(100) 
AFTER LAST_NAME; #WILL DISPLAY AFTER LAST_NAME 

SELECT * FROM EMP;

ALTER TABLE EMP
MODIFY EMAIL VARCHAR(100)
FIRST;

ALTER TABLE EMP
DROP COLUMN EMAIL;

SELECT * FROM EMP;

#-------------------------------------

INSERT INTO EMP
VALUES (1,"Eugene" ,"Krabs",25.50,"2030-01-02");

INSERT INTO EMP
VALUES (1,"Eugene" ,"Krabs",25.50,"2023-01-02"),
(2,"Squidward" ,"Tentacles",25.50,"2023-01-04"),
(3,"Patrick" ,"Star",12.50,"2023-01-05"),
(4,"Sandy" ,"Cheeks",25.50,"2023-01-06");

INSERT INTO EMP(EMP_ID,FIRST_NAME, LAST_NAME)
VALUES (1,"Sheldon" , "Plankton");


SELECT * FROM EMP;

SELECT  LAST_NAME, FIRST_NAME
FROM EMP;

SELECT *
FROM EMP
WHERE FIRST_NAME="Eugene";

SELECT *
FROM EMP
WHERE HOURLY_PAY>="15";

SELECT * 
FROM EMP
WHERE HIRE_DAY <= "2023-01-06";

SELECT * 
FROM EMP
WHERE HIRE_DAY <= "2023-01-06";

SELECT * 
FROM EMP
WHERE EMP_ID!= 1;


SELECT * 
FROM EMP
WHERE HIRE_DAY IS NOT NULL;

#------------UPDATE & DELETE-----------------------
SELECT * FROM EMP;

UPDATE EMP 
SET HOURLY_PAY =10.40,
	HIRE_DAY= "2023-01-07"
WHERE EMP_ID=2;

UPDATE EMP 
SET EMP_ID =2,
	HIRE_DAY= "2023-01-03",
    HOURLY_PAY=30.50
WHERE FIRST_NAME="Squidward";

SELECT * FROM EMP;

INSERT INTO EMP
VALUES (1,"Eugene" ,"Krabs",25.50,"2023-01-02"),
(2,"Squidward" ,"Tentacles",25.50,"2023-01-04"),
(3,"Patrick" ,"Star",12.50,"2023-01-05"),
(4,"Sandy" ,"Cheeks",25.50,"2023-01-06"),
(5,"Spongebob" ,"Peacock",30.50,"2023-01-07");

UPDATE EMP
SET HOURLY_PAY= 10.00;#NO USE OF WHERE CLAUSE
# THIS WILL AFFECT ALL THE COLUMN 

DELETE FROM EMP 
WHERE EMP_ID =5;
SELECT * FROM EMP;


SET AUTOCOMMIT =OFF; #WILL NOT SAVE AUTOMATICALLY
COMMIT;# WE CREATED THE SAVE POINT TO DELTE STATEMENT

DELETE FROM EMP;#FOR UNDO THIS CHANGE

ROLLBACK;
#IF WE REALLY WANT TO DELETE THE TABLE THEN WE NEED TO DELETE AND THEN COMMIT IT


CREATE TABLE TEST(
	MY_DATE DATE,
    MY_TIME TIME,
    MY_DATETIME DATETIME
    );

SELECT * FROM TEST;

INSERT INTO TEST 
VALUES (CURRENT_DATE()-1, 
		NULL,
        NULL);
        
USE DB;
SELECT * FROM TEST;
DROP TABLE TEST;

CREATE TABLE PRODUCTS (
PRODUCT_ID INT ,
PRODUCT_NAME VARCHAR (23) UNIQUE, 
PRICE DECIMAL(4,2)
);

ALTER TABLE PRODUCTS 
ADD CONSTRAINT 
UNIQUE (PRODUCT_ID);

SELECT * FROM PRODUCTS;

INSERT INTO PRODUCTS
VALUE (100,"HAMBURGER",2.32),
	(101,"FRIES",1.34),
	(102,"ICE-CREAM",1.00),
	(103,"COLD-DRINK",2.00);

INSERT INTO PRODUCTS
VALUE (104,"CHICKEN", 1.34);#DUPLICATE ENTRY UNDER PRODUCT NAME

SELECT * FROM PRODUCTS;

ALTER TABLE PRODUCTS 
MODIFY PRICE DECIMAL (4,2) NOT NULL;


#---------CHECK LIMIT 
USE DB;
ALTER TABLE EMP
ADD CONSTRAINT CHK_HOURLY_PAY CHECK (HOURLY_PAY >=10.00);

SELECT * FROM EMP;

INSERT INTO EMP
VALUES ( 6,"SHELDON" , "PLANTKON" , 19.00, "2023-03-03");


#TO DELETE THE CHECK
ALTER TABLE EMP
DROP CHECK CHK_HOURLY_PAY;


#-----------DEFAULT------------------

SELECT * FROM PRODUCTS;

INSERT INTO PRODUCTS
VALUES (104, "STRAW", 0.00),
		(105, "NAPKIN", 0.00),
        (106, "FORK", 0.00),
        (107, "SPOON", 0.00);

DELETE FROM PRODUCTS 
WHERE PRODUCT_ID >=104;


#RECREATING A TABLE WITH DEFAULT CONSTRAINTS
CREATE TABLE PRODUCT(
PRODUCTS_ID INT,
PRODUCTS_NAME VARCHAR(35),
PRICE DECIMAL(4,2) DEFAULT 0.00
);

#TABLE WHICH EXIST 
ALTER TABLE PRODUCTS 
ALTER PRICE SET DEFAULT 0;

SELECT * FROM PRODUCTS;
#WE ARE ADDING EXPLICITILY THAT WHY WE HAVE TO INCLUDE IT OTHER WISE IT WILL FAULT COLUMN COUNT DOESN'T MATCH
INSERT INTO PRODUCTS (PRODUCT_ID, PRODUCT_NAME)
VALUES  (104,"STARW"),
		(105,"NAPKIN"),
        (106,"FORK"),
        (107,"SPOON");

CREATE TABLE transactions (
		transaction_id INT,
        amount DECIMAL (5,2),
		transaction_date DATETIME DEFAULT NOW()  #THE DATE AND TIME WILL BE ADDED AUTO 
            );
		
INSERT INTO transactions (transaction_id,amount) VALUES (3,5.01);
SELECT * FROM transactions;


#-----------------------------------PRIMARY KEYS--------------------------
# A table can only one primary keys 
#CREATE TABLE transactions ( transaction_id INT PRIMARY KEY , amount DECIMAL(5,2);
ALTER TABLE transactions MODIFY COLUMN transaction_id INT PRIMARY KEY;
SELECT * FROM transactions;

#IF ALREADY EXISTS THE TABLE HOW TO ADD PRIMARY KEY CONSTRAINT
ALTER TABLE transactions
ADD CONSTRAINT
PRIMARY KEY(AMONT);  #multiple primary key defined

INSERT INTO transactions (transaction_id,amount) VALUES (2000,5.01);
INSERT INTO transactions (transaction_id,amount) VALUES (null,5.01);

SELECT * FROM transactions;
SELECT amount FROM transactions WHERE transaction_id =1000;

#------------------------------AUTO INCREMENT---------------------------------------------
DROP TABLE transactions;
CREATE TABLE transations (
			transaction_id INT PRIMARY KEY AUTO_INCREMENT, #default set to 1
            amount DECIMAL (5,2)
				);

SELECT * FROM transations;

RENAME TABLE transations TO  transactions;
INSERT INTO transactions (amount)
VALUES (4.01); 

SELECT * FROM transactions;

DELETE FROM transactions;
ALTER TABLE transactions 
AUTO_INCREMENT =1000;
INSERT INTO transactions (amount)
VALUES (2.01); 

#---------------------------------FOREIGN KEYS--------------------------

CREATE TABLE customers(
			customer_id INT PRIMARY KEY AUTO_INCREMENT ,
            first_name VARCHAR (23),
            last_name VARCHAR(50)
            );
SELECT * FROM customers; 
INSERT INTO customers(first_name, last_name)
VALUES ("Aman", "Fish"),
		("Raj", "Curry"),
		("Raj", "Roti");
	
DROP TABLE transactions;
CREATE TABLE transations (
		transaction_id INT PRIMARY KEY AUTO_INCREMENT,
        amount DECIMAL (5,2),
        customer_id INT, #here customer_id is primary key 
        FOREIGN KEY(customer_id ) REFERENCES customers(customer_id)
        );

SELECT * FROM transations;

#naming the foreign key and adding the forign key already exists
ALTER TABLE transations
ADD CONSTRAINT fk_customer_id
FOREIGN KEY (customer_id) REFERENCES customers(customer_id);

#To drop a foreign key constraint
ALTER TABLE transations
DROP FOREIGN KEY transations_ibfk_1;

DELETE FROM transations;
SELECT * FROM transations;

ALTER TABLE transations 
AUTO_INCREMENT =1000;

INSERT INTO transations (amount ,customer_id)
VALUES (4.99,3),(2.89,2),(3.38,3),(4.99,1);

#primary key (transation) foreign key (customer_id)

DELETE FROM customer WHERE customer_id =2;
#Cannot delete because this is the foreign key

#-----------------------------JOINS--------------------------------
#A joins is the clause that joins the row from the two or more tables
#based on the related column between them such as foreign key

INSERT INTO transations (amount , customer_id)
VALUES (1.00, NULL);

SELECT * FROM transations;
INSERT INTO customers (first_name, last_name)
VALUES ("Poppy" , "Puff");

SELECT * FROM customers;
# ----------------Inner join ------------------------
SELECT * 
FROM transations INNER JOIN  customers
ON transations







