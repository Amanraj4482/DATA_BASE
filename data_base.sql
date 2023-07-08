1.DDl(Data Definition Language)	->CREATE,ALTER , DROP,TRUNCATE, RENAME
2.DML(Data Manipulation Language)->INSERT, UPDATE, DELETE
3.DRL/DQL(Data Retrieval Language/Data Query Language)->SELECT
4.TCL(Transaction Control Language)->COMMIT , ROLLBACK , SAVEPOINT
5.DCL(Data Control Language)-> GRANT, REVOKE

 

#-----------------------------------------******888888888888888888888*******-------------------------------------------------

#----------------creating the database if not available -----------------
CREATE DATABASE IF NOT EXISTS mydb;
DROP DATABASE mydb;#dropping the database

CREATE SCHEMA mydb;
DROP SCHEMA mydb;

USE mydb;
CREATE TABLE STUDENT(SNO INT (5) , SNAME VARCHAR (15) ,MARKS INT (3));

DESCRIBE STUDENT;

#---------------inserting data into the tables--------------
INSERT INTO STUDENT VALUES (101,'AMAN', 90);
#if order is not specified the user can pass the data whichever order he wants
INSERT INTO STUDENT (SNAME,SNO,MARKS) VALUES ('RAM',102,40);
#if some data is not known to the user
INSERT INTO STUDENT VALUES (102,'SHARDA',10,'SANJU');
INSERT INTO STUDENT VALUES (133,'RAJ',22);

#---------------------Retrive the data-------------
SELECT * FROM STUDENT;#star represents the whole table
SELECT SNAME, SNO FROM STUDENT; # if we have to see the specific column 
SELECT SNAME Stu_NAME ,SNO Stu_Name  FROM STUDENT; #hiding the original name (COLUMN ALIAS)

#if we want to increase the marks of all the students by 5 
SELECT SNAME, SNO , MARKS+5 FROM STUDENT;

#---------------where commands use with the select (arthmatic operators)
SELECT * FROM STUDENT;
SELECT * FROM STUDENT WHERE MARKS<10;
SELECT * FROM STUDENT WHERE MARKS>=10;
SELECT * FROM STUDENT WHERE MARKS =90;
SELECT * FROM STUDENT WHERE MARKS is null;
SELECT * FROM STUDENT WHERE SNAME='AMAN';

SELECT SNO FROM STUDENT;
#this distinct keyword gives the unique records not repeating the same value
SELECT DISTINCT SNO FROM STUDENT;
SELECT DISTINCT * FROM STUDENT; 
 
 #-----------------logical operators(to check more than one condition)
 SELECT * FROM STUDENT WHERE SNO >100 AND SNAME='NIRMAN';
 SELECT * FROM STUDENT WHERE SNO >101 OR MARKS>50;
 SELECT * FROM STUDENT WHERE NOT SNAME ='AMAN'; #except this record all will be displayed
 
 
 #-------------------between and in operators-->
 #BETWEEN->used to display the rows which is following in the range of values.
 #opposite NOT BETWEEN
 
 SELECT * FROM STUDENT WHERE MARKS BETWEEN 50 AND 100;
 SELECT * FROM STUDENT WHERE SNO NOT BETWEEN 100 AND 101;

 #in-> IN operator return the rows when the values are matching in the list 
 # not in 
 
 SELECT * FROM STUDENT WHERE MARKS =40 OR SNO= 102 OR SNO =101;
 SELECT * FROM STUDENT WHERE MARKS IN(40,100);#either 40 or 100
 SELECT * FROM STUDENT WHERE MARKS NOT IN ( 40 ,50);#excluding this give the marks
 
 #pattern matching operators(whiled card characters)
 #can be only used with LIKE operators
 #  %-->many characters       _ ->> single characters
 
 SELECT * FROM STUDENT WHERE SNAME LIKE 'A%'; #first char should be A and after it any char matching
 SELECT * FROM STUDENT WHERE SNAME LIKE '%r'; #r should be the last char
 SELECT * FROM STUDENT WHERE SNAME LIKE 'A%N';#starting A and ending with N will show only that name
 SELECT * FROM STUDENT WHERE SNAME LIKE '%M%';#(%) represents the many char in the middle somewhere m can be there
 
 SELECT * FROM STUDENT WHERE SNAME NOT LIKE 'A%';#name not starting with A
 SELECT * FROM STUDENT WHERE SNAME LIKE '%A_';#shows the data where there is only one char after A
 SELECT * FROM STUDENT WHERE SNAME LIKE '___';#only with 3 chars with 3 underscores
 
 
 #----------DDL Commands (Data Definition Language)
 #---------------------------------------#
 # CREATE, ALTER , DROP , TRUNCATE , RENAME
 
 USE mydb;
 DROP TABLE STUDENT;
 
 #-----------------creating table
 CREATE TABLE STUDENT(SNO INT (5),SNAME VARCHAR (15) ,MARKS INT (3));
 DESCRIBE STUDENT;
 
 INSERT INTO STUDENT VALUES (101,'AMAN', 90);
 INSERT INTO STUDENT (STUNAME,SNO,MARKS) VALUES ('RAM',102,40);
 INSERT INTO STUDENT VALUES (102,'NIRMAN',NULL);
 INSERT INTO STUDENT VALUES (105,'RAANU',100,'JHATU');
 
 COMMIT;#---------------data will be permanent;
 SELECT * FROM STUDENT;
 
 #a-------------dding column using the ALTER command(col_name, datatype (size))
 ALTER TABLE STUDENT ADD(GRADE VARCHAR (10));
 INSERT INTO STUDENT VALUES(106,'ROUSHNI',200,'RAMNA');
 DESCRIBE STUDENT;
 
 #--------to drop the column----------------
 ALTER TABLE STUDENT DROP COLUMN GRADE;
 
 #inc the size of the column datatypes
 ALTER TABLE STUDENT MODIFY COLUMN SNAME VARCHAR (20);#15->20 increased
 
 #before dec the colum datatypes first should remove the data 
 
 #--------Renaming the column with-------- (old name to  new name)
ALTER TABLE STUDENT RENAME COLUMN SNAME TO STUNAME;
 
 #comparison (DROP TRUNCATE DELETE)
 #drop->data column definition table everything gone.
 #truncate->Table present but data will be deleted permanently
 #delete ->data will be deleted temprorly we can also rollback the data
 
 # we need to set the autocommit =0 before exicuting the (drop truncate delete)
 #if the autocommit =1 permanent save in table __if 0 then temprory
 #by default autocommit =0 is enabled
 #inserting some data in the table then commit; for permanent
 
 SET autocommit=0;#if using the =0 then we need to commit for permanent changes
 #if set to =1 then commit ; is not needed
 #whenever we do delete or updates we need to do this
 SET SQL_SAFE_UPDATES =0;#only it will allow us to update the table
 
 DELETE FROM STUDENT ;#works on data not definition
 #will delete all the data from the student
 #if we use commit command we get the data back or we cannot use ROLLBACK
 
 COMMIT;#-----------data will not be recoved
 #for retrive the data 
 
 ROLLBACK;#associated for the DML commands only
  
  #whereas truncate is the DDL we cannot get back the data once deleted
 
 TRUNCATE TABLE STUDENT;#permanently delete the data
 
 DROP TABLE STUDENT;#completely deleted the table
 
 RENAME TABLE STUDENT TO STUDENTSS; #name changed of the table
 
 SELECT * FROM STUDENTSS;
 
 #--------------for rechange the name----------------
 RENAME TABLE STUDENTSS TO STUDENT;
 #for renaming a column in a table we use alter command
 
  
 #----------built-in Functions in MYSQL------------------
 
 #----------------------STRINGS Functions---------
 #UPPER & LOWER CASE >>>>
 SELECT UPPER('smith');#--> SMITH RETURNS
 SELECT UPPER(STUNAME) FROM STUDENT;#only in the presentation it will appear upper
 SELECT LOWER(STUNAME) FROM STUDENT;
 
 
 #------------------------LENGTH ------------------>>>
 SELECT LENGTH('WELCOM');#returns the length of string=6
 SELECT LENGTH(STUNAME) FROM STUDENT;# length of all name in the table
 
 #Print Names of students whose name has 4 chars
 SELECT * FROM STUDENT WHERE LENGTH(STUNAME)=4;
 
 #----------------TRIM()---------------> removes the specified characters from both the sides
 
 SELECT TRIM('     WELCOME      ');#returns without spaces (WELCOME)
 SELECT TRIM('z' FROM 'zzoraclezz');#all z's will be treamed result=oracle
 
 #NSTR()-> returns the position of the character within a string
 SELECT INSTR('ORACLE','C');#C is at 4 position
 
 
 #------------------SUBSTR()/SUBSTRING()---------> returns the substring of the string.
 SELECT SUBSTR('ORACLE',2,3); -- RAC
 SELECT SUBSTR('ORACLE',3,3); -- ACL
 SELECT SUBSTR('ORACLE',4,3); -- CLE
 
 -- these both are same
 SELECT SUBSTRING('ORACLE',2,3); -- RAC
 SELECT SUBSTRING('ORACLE',3,3); -- ACL
 SELECT SUBSTRING('ORACLE',4,3); -- CLE
 
#print only first chars in the column
SELECT SUBSTRING(STUNAME,1,2) FROM STUDENT;

#----------------------concate ()------------ : To join two strings
SELECT CONCAT('ORACLE','FUCKED'); -- ORACLEFUCKED
SELECT CONCAT(STUNAME,GRADE) FROM STUDENT; -- ROUSHNIRAMNA

#ALLIAS-->
SELECT CONCAT(STUNAME,GRADE) FULLNAME FROM STUDENT;

#numeric functions---(ABS , SQRT , MOD ,POWER ,TRUNCATE)
#this is the TRUNCATE FUNCTION and that was TRUNCATE COMMAND both are different
SELECT ABS(-30); #30 returns
 
 SELECT TRUNCATE(40.12345,3); -- 40.123
 SELECT TRUNCATE(765432,-3); -- 765000
 
 SELECT GREATEST(100,200,300,400,500); #returns =500
 SELECT LEAST(1,2,4,5,6); #returns =1
 
 #-----------------------DATE FUNCTIONS()-----------------------
 
 SELECT CURRENT_DATE(); #returns = 2023-07-08(YY-MM-DD)
 SELECT CURDATE();##returns = 2023-07-08(YY-MM-DD)
 
 SELECT CURRENT_TIME();#13:05:36
 SELECT CURTIME();#13:05:36
 
 SELECT NOW();# returns date and time both =  2023-07-08 13:06:22
 
 #this returns current system data and time
 SELECT SYSDATE();#2023-07-08 13:07:30
 
 SELECT MONTH("2019-05-23"); #returns =5  YEAR()   DATE()  -- functions retrives the month ,year ,date part individually
  
#-------------------Aggregate functions------ are all about performing calculations on multiple rows of a single column of a Table and returning a single value.
#works only on single table
SELECT AVG(MARKS) FROM STUDENT;-- 87.7500
SELECT SUM(MARKS) FROM STUDENT;-- 351
SELECT MIN(MARKS) FROM STUDENT; -- 22
SELECT MAX(MARKS) FROM STUDENT; -- 200
SELECT COUNT(*) FROM STUDENT; -- returns total no 
 
 SELECT * FROM STUDENT;
 #-----------------------------GROUP BY---------------------------------------
 #sum,avg,min,max of all STUNAME marks who belongs to specific SNO
 
 SELECT SNO, SUM(MARKS) FROM STUDENT GROUP BY SNO;
 SELECT SNO, AVG(MARKS) FROM STUDENT GROUP BY SNO;
 SELECT SNO, MAX(MARKS),MIN(MARKS) FROM STUDENT GROUP BY SNO;
 SELECT SNO ,COUNT(*) FROM STUDENT GROUP BY SNO;#in each SNO how many have same SNO no by returns the count of them
 
 #group the results based on the two columns--------------------------------
 #no of the group should be null other wise it will give error
 SELECT SNO,STUNAME,COUNT(*) FROM STUDENT GROUP BY SNO,STUNAME;# how many have similar Sno and grade also
 
 #--------------------HAVING CLAUSE-----------------
 SELECT SNO,STUNAME ,COUNT(*) FROM STUDENT GROUP BY SNO,STUNAME HAVING COUNT(*) >0;

 SELECT STUNAME,SUM(MARKS) FROM STUDENT GROUP BY SNO,STUNAME HAVING SUM(MARKS)>90;
 
 #where clause--> use for setting the contitions or filter the rows
 #having clause--> use for conditions putting on the top of grouped data
 # but before putting any data on group if we want to apply condition we have to go for where clause
 
 #         WHERE ---------- GROUP BY --------------HAVING
 SELECT SNO, SUM(MARKS) FROM STUDENT WHERE SNO<>102 GROUP BY SNO; #exclue the 102 data in the list
 
 SELECT SNO , SUM(MARKS) FROM STUDENT WHERE SNO<>102 GROUP BY SNO HAVING SUM(MARKS)>80;
 
 #------------------HAVING & ORDER by clause---------------
 
 
 
 
 
 
 
 
  
 
 
#-----------------------------------------*******888888888888888888******-------------------------------------------------

1) Created database
2) Created Table student
3) Inserted data into Student Table
4) Select/Retrive the data from a table
5) Where (Flitering records based on condition)
6) Distinct (Displays the unique records)
7) AND , OR , NOT 
8) BETWEEN , NOT BETWEEN 
9) Pattern matching (LIKE ,NOT LIKE)
10) Drop , delete , truncate (commit)


_______________SQL Data Types____________
* Numeric
* Text
* Data/Time



______NUMERIC____DATA_TYPES________

TINYINT							-128 to 127 normal (0 to 255 UNSIGNED)

SMALLINT 						-32768 TO 32767 normal (0 to 65535 UNSIGNED.)

MEDIUMINT						-8388608 TO 8388607 normal(0 to 16777215 UNSIGNED.)

INT 							-2147483648 TO 2147483647 normal(0 to 4294967295 UNSIGNED.)

BIGINT 							-92233720362036854775808 TO 92233720362036854775807 normal (0 to 18446744073709551615 UNSIGNED.)


FLOAT 							A small approximate number with a floating decimal point.

DOUBLE (.)						A large number with a floating decimal point.

DECIMAL(.)						A DOUBLE stored as a string, allowing for a fixed decimal point. Choice for storing currency values.




_______TEXT Data Types____

CHAR()							A fixed section form 0 to 255 characters long.

VARCHAR()						A variable section from 0 to 255 characters long.

BLOB							A String with a maximum length of 65535 characters.

MEDIUMTEXT 						A string with a maximum length of 16777215 characters.

MEDIUMBLOB						A string with a maximum length of 4294967295

LONGTEXT						A string with a maximum length of 4294967295 characters.

LONGBOB							A string with a maximum length of 4294967295 characters.



_____Data & Time_____


DATA 							YYYY-MM-DD

DATATIME				        YYYY-MM-DD HH:MM:SS

TIMESTAMP						YYYYMMDDHHMMSS

TIME 							HH:MM:SS




 #DDL Commands (Data Definition Language)
 #---------------------------------------#
 # CREATE, ALTER , DROP , TRUNCATE , RENAME

 * CREATE -> is used to create database objects ( Database , Table , views , synoymes etc...)

 * ALTER -> *Adding a new column

 			*Dropping the existing column

 			*Modifying the existing column (Inc / Dec size of the column & change the data Type of the column)

 			*Renaming a column

 *DROP ->   *data column definition table everything gone.

* RENAME -> * renaming the table;



MYSQL FUNCTION BUILT - IN 

1) Strings functions - operate on string data types

2) Numeric functions - operate on numberic data types

3) Data functions - operate on data types

4) Aggregate functions - operate on all of the data and produce summarized result sets




_______GROUP BY CLAUSE______

* The Group by clause groups records into summary rows.

* Group by returns one records for each group

* Group by typically also involves aggregates : COUNT , MAX, SUM, AVG etc;

* GROUP by can group by one or more columns.
