mysql> create database Address_Book_Service;
Query OK, 1 row affected (0.02 sec)

mysql> show databases;
+----------------------+
| Database             |
+----------------------+
| address_book_service |
| bookstore            |
| crud                 |
| demo                 |
| emp                  |
| information_schema   |
| mysql                |
| payroll_service      |
| performance_schema   |
| sakila               |
| sys                  |
| world                |
| zaid                 |
+----------------------+
13 rows in set (0.01 sec)

mysql> USE Address_Book_Service;
Database changed

mysql> CREATE TABLE  addressBook(firstName varchar(50) NOT NULL, lastName varchar(50) NOT NULL, mobileNumber varchar(20) NOT NULL,email varchar(50) NOT NULL, city varchar(50) NOT NULL, state varchar(50) NOT NULL,zip long NOT NULL, PRIMARY KEY(firstName));
Query OK, 0 rows affected (0.09 sec)

mysql> desc addressbook;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| firstName    | varchar(50) | NO   | PRI | NULL    |       |
| lastName     | varchar(50) | NO   |     | NULL    |       |
| mobileNumber | varchar(20) | NO   |     | NULL    |       |
| email        | varchar(50) | NO   |     | NULL    |       |
| city         | varchar(50) | NO   |     | NULL    |       |
| state        | varchar(50) | NO   |     | NULL    |       |
| zip          | mediumtext  | NO   |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
7 rows in set (0.01 sec)

mysql> INSERT INTO addressbook(firstName,lastName,mobileNumber,email,city,state,zip) VALUES('Parvez','Makandar','8147340746','parvezhm050@gmail.com','Belgaum','Karnataka',590010),('Faizan','Pathan','8976578989','faizan@gmail.com','Belgaum','Karnataka',590016),('Senthil','Kumar','9909098789','Btech@gmail.com','Coimbotore','TN',636560);
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from addressBook;
+-----------+----------+--------------+-----------------------+------------+-----------+--------+
| firstName | lastName | mobileNumber | email                 | city       | state     | zip    |
+-----------+----------+--------------+-----------------------+------------+-----------+--------+
| Faizan    | Pathan   | 8976578989   | faizan@gmail.com      | Belgaum    | Karnataka | 590016 |
| Parvez    | Makandar | 8147340746   | parvezhm050@gmail.com | Belgaum    | Karnataka | 590010 |
| Senthil   | Kumar    | 9909098789   | Btech@gmail.com       | Coimbotore | TN        | 636560 |
+-----------+----------+--------------+-----------------------+------------+-----------+--------+
3 rows in set (0.01 sec)

mysql> UPDATE addressBook set MobileNumber= "8660991625" where FirstName='Parvez';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE addressBook set Zip= "590016" where FirstName='Parvez';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE addressBook set State= 'New Belgaum' where FirstName='Parvez';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE addressBook set City= 'Belgaum' where FirstName='Parvez';
Query OK, 0 rows affected (0.01 sec)
Rows matched: 1  Changed: 0  Warnings: 0

mysql> select * from addressBook;
+-----------+----------+--------------+-----------------------+------------+-------------+--------+
| firstName | lastName | mobileNumber | email                 | city       | state       | zip    |
+-----------+----------+--------------+-----------------------+------------+-------------+--------+
| Faizan    | Pathan   | 8976578989   | faizan@gmail.com      | Belgaum    | Karnataka   | 590016 |
| Parvez    | Makandar | 8660991625   | parvezhm050@gmail.com | Belgaum    | New Belgaum | 590016 |
| Senthil   | Kumar    | 9909098789   | Btech@gmail.com       | Coimbotore | TN          | 636560 |
+-----------+----------+--------------+-----------------------+------------+-------------+--------+
3 rows in set (0.00 sec)

mysql> DELETE from addressBook where FirstName='Faizan';
Query OK, 1 row affected (0.01 sec)

mysql> select * from addressBook;
+-----------+----------+--------------+-----------------------+------------+-------------+--------+
| firstName | lastName | mobileNumber | email                 | city       | state       | zip    |
+-----------+----------+--------------+-----------------------+------------+-------------+--------+
| Parvez    | Makandar | 8660991625   | parvezhm050@gmail.com | Belgaum    | New Belgaum | 590016 |
| Senthil   | Kumar    | 9909098789   | Btech@gmail.com       | Coimbotore | TN          | 636560 |
+-----------+----------+--------------+-----------------------+------------+-------------+--------+
2 rows in set (0.00 sec)

mysql>  INSERT INTO addressbook(firstName,lastName,mobileNumber,email,city,state,zip) VALUES('Faizan','Pathan','8976578989','faizan@gmail.com','Belgaum','Karnataka',590016);
Query OK, 1 row affected (0.02 sec)

mysql> select * from addressBook;
+-----------+----------+--------------+-----------------------+------------+-------------+--------+
| firstName | lastName | mobileNumber | email                 | city       | state       | zip    |
+-----------+----------+--------------+-----------------------+------------+-------------+--------+
| Faizan    | Pathan   | 8976578989   | faizan@gmail.com      | Belgaum    | Karnataka   | 590016 |
| Parvez    | Makandar | 8660991625   | parvezhm050@gmail.com | Belgaum    | New Belgaum | 590016 |
| Senthil   | Kumar    | 9909098789   | Btech@gmail.com       | Coimbotore | TN          | 636560 |
+-----------+----------+--------------+-----------------------+------------+-------------+--------+
3 rows in set (0.00 sec)

mysql> SELECT * from addressBook where city = 'Belgaum';
+-----------+----------+--------------+-----------------------+---------+-------------+--------+
| firstName | lastName | mobileNumber | email                 | city    | state       | zip    |
+-----------+----------+--------------+-----------------------+---------+-------------+--------+
| Faizan    | Pathan   | 8976578989   | faizan@gmail.com      | Belgaum | Karnataka   | 590016 |
| Parvez    | Makandar | 8660991625   | parvezhm050@gmail.com | Belgaum | New Belgaum | 590016 |
+-----------+----------+--------------+-----------------------+---------+-------------+--------+
2 rows in set (0.00 sec)

mysql> SELECT * from addressBook where state = 'Karnataka';
+-----------+----------+--------------+------------------+---------+-----------+--------+
| firstName | lastName | mobileNumber | email            | city    | state     | zip    |
+-----------+----------+--------------+------------------+---------+-----------+--------+
| Faizan    | Pathan   | 8976578989   | faizan@gmail.com | Belgaum | Karnataka | 590016 |
+-----------+----------+--------------+------------------+---------+-----------+--------+
1 row in set (0.00 sec)

mysql> SELECT city,COUNT(city) as count from addressBook group by city;
+------------+-------+
| city       | count |
+------------+-------+
| Belgaum    |     2 |
| Coimbotore |     1 |
+------------+-------+
2 rows in set (0.01 sec)

mysql> SELECT state,COUNT(state) as count from addressBook group by state;
+-------------+-------+
| state       | count |
+-------------+-------+
| Karnataka   |     1 |
| New Belgaum |     1 |
| TN          |     1 |
+-------------+-------+
3 rows in set (0.00 sec)

mysql> SELECT firstName,lastName from addressBook ORDER BY city;
+-----------+----------+
| firstName | lastName |
+-----------+----------+
| Faizan    | Pathan   |
| Parvez    | Makandar |
| Senthil   | Kumar    |
+-----------+----------+
3 rows in set (0.00 sec)

mysql> alter table addressBook add type varchar(15) after lastName;
Query OK, 0 rows affected (0.13 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc addressBook;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| firstName    | varchar(50) | NO   | PRI | NULL    |       |
| lastName     | varchar(50) | NO   |     | NULL    |       |
| type         | varchar(15) | YES  |     | NULL    |       |
| mobileNumber | varchar(20) | NO   |     | NULL    |       |
| email        | varchar(50) | NO   |     | NULL    |       |
| city         | varchar(50) | NO   |     | NULL    |       |
| state        | varchar(50) | NO   |     | NULL    |       |
| zip          | mediumtext  | NO   |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
8 rows in set (0.01 sec)

mysql> update addressBook set type = 'Family' where firstName = 'Faizan';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update addressBook set type = 'Friend' where firstName='Senthil';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update addressBook set type = 'Family' where firstName = 'Parvez';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from addressBook;
+-----------+----------+--------+--------------+-----------------------+------------+-------------+--------+
| firstName | lastName | type   | mobileNumber | email                 | city       | state       | zip    |
+-----------+----------+--------+--------------+-----------------------+------------+-------------+--------+
| Faizan    | Pathan   | Family | 8976578989   | faizan@gmail.com      | Belgaum    | Karnataka   | 590016 |
| Parvez    | Makandar | Family | 8660991625   | parvezhm050@gmail.com | Belgaum    | New Belgaum | 590016 |
| Senthil   | Kumar    | Friend | 9909098789   | Btech@gmail.com       | Coimbotore | TN          | 636560 |
+-----------+----------+--------+--------------+-----------------------+------------+-------------+--------+
3 rows in set (0.00 sec)

mysql> select type, Count(type) from addressBook group by type;
+--------+-------------+
| type   | Count(type) |
+--------+-------------+
| Family |           2 |
| Friend |           1 |
+--------+-------------+
2 rows in set (0.01 sec)

mysql> INSERT INTO addressbook(firstName,lastName,type,mobileNumber,email,city,state,zip) VALUES
    ('Priyanka','KS','Friend','9989878989','priynkaks@yahoo.com','davangere','KAR',560066);
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO addressbook(firstName,lastName,type,mobileNumber,email,city,state,zip) VALUES
    ('Rehan,'Khan','Family','9900909089','rehan@yahoo.com','Doha','Qatar',122104);
    '> ;

mysql> INSERT INTO addressbook(firstName,lastName,type,mobileNumber,email,city,state,zip) VALUES('Rehan','Raina','Friend','9900989809','rehan@yahoo.com','Doha','Qatar',122104);
Query OK, 1 row affected (0.02 sec)

mysql> select * from addressbook;
+-----------+----------+--------+--------------+-----------------------+------------+-------------+--------+
| firstName | lastName | type   | mobileNumber | email                 | city       | state       | zip    |
+-----------+----------+--------+--------------+-----------------------+------------+-------------+--------+
| Faizan    | Pathan   | Family | 8976578989   | faizan@gmail.com      | Belgaum    | Karnataka   | 590016 |
| Parvez    | Makandar | Family | 8660991625   | parvezhm050@gmail.com | Belgaum    | New Belgaum | 590016 |
| Priyanka  | KS       | Friend | 9989878989   | priynkaks@yahoo.com   | davangere  | KAR         | 560066 |
| Rehan     | Raina    | Friend | 9900989809   | rehan@yahoo.com       | Doha       | Qatar       | 122104 |
| Senthil   | Kumar    | Friend | 9909098789   | Btech@gmail.com       | Coimbotore | TN          | 636560 |
+-----------+----------+--------+--------------+-----------------------+------------+-------------+--------+
5 rows in set (0.00 sec)

mysql> CREATE TABLE  contacts(firstName varchar(50) NOT NULL, lastName varchar(50) NOT NULL,mobileNumber varchar(20) NOT NULL,email varchar(50) NOT NULL, PRIMARY KEY(firstName));
Query OK, 0 rows affected (0.07 sec)

mysql> desc contacts;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| firstName    | varchar(50) | NO   | PRI | NULL    |       |
| lastName     | varchar(50) | NO   |     | NULL    |       |
| mobileNumber | varchar(20) | NO   |     | NULL    |       |
| email        | varchar(50) | NO   |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
4 rows in set (0.02 sec)

mysql> create table address(zip varchar(6) not null, city varchar(30) not null,  state varchar(30) not null, primary key(zip));
Query OK, 0 rows affected (0.07 sec)

mysql> desc address;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| zip   | varchar(6)  | NO   | PRI | NULL    |       |
| city  | varchar(30) | NO   |     | NULL    |       |
| state | varchar(30) | NO   |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
3 rows in set (0.02 sec)

mysql> create table contacts_address(firstname varchar(30) not null, zip varchar(6) not null, foreign key (firstname) references contacts(firstname), foreign key (zip) references address(zip));
Query OK, 0 rows affected (0.09 sec)

mysql> desc contacts_address;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| firstname | varchar(30) | NO   | MUL | NULL    |       |
| zip       | varchar(6)  | NO   | MUL | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> show databases;
+----------------------+
| Database             |
+----------------------+
| address_book_service |
| bookstore            |
| crud                 |
| demo                 |
| emp                  |
| information_schema   |
| mysql                |
| payroll_service      |
| performance_schema   |
| sakila               |
| sys                  |
| world                |
| zaid                 |
+----------------------+
13 rows in set (0.01 sec)

mysql> create table relations(type varchar(15), primary key(type));
Query OK, 0 rows affected (0.06 sec)

mysql> desc relations;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| type  | varchar(15) | NO   | PRI | NULL    |       |
+-------+-------------+------+-----+---------+-------+
1 row in set (0.02 sec)

mysql> create table contacts_relation( firstname varchar(30) not null, type varchar(15), foreign key(firstname) references contacts(firstname), foreign key(type) references relations(type));
Query OK, 0 rows affected (0.09 sec)

mysql> desc contacts_relation;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| firstname | varchar(30) | NO   | MUL | NULL    |       |
| type      | varchar(15) | YES  | MUL | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> insert into contacts values('Zaid','Mak','9987670909','zaid@gmail.com'),('Sufiyan','Jiddimani','7787898909','sufi@gmail.com'),('Asma','Syed','8878789809','asma@yahoo.com');
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from contacts;
+-----------+-----------+--------------+----------------+
| firstName | lastName  | mobileNumber | email          |
+-----------+-----------+--------------+----------------+
| Asma      | Syed      | 8878789809   | asma@yahoo.com |
| Sufiyan   | Jiddimani | 7787898909   | sufi@gmail.com |
| Zaid      | Mak       | 9987670909   | zaid@gmail.com |
+-----------+-----------+--------------+----------------+
3 rows in set (0.00 sec)

mysql> insert into relations values('family'),('friend'),('work');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from relations;
+--------+
| type   |
+--------+
| family |
| friend |
| work   |
+--------+
3 rows in set (0.00 sec)

mysql> insert into address values ('590016','Belgaum','Karnataka'),('590010','Belgaum','Karnataka'), ('121001','Faridabad','Delhi');
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from address;
+--------+-----------+-----------+
| zip    | city      | state     |
+--------+-----------+-----------+
| 121001 | Faridabad | Delhi     |
| 590010 | Belgaum   | Karnataka |
| 590016 | Belgaum   | Karnataka |
+--------+-----------+-----------+
3 rows in set (0.00 sec)

mysql> insert into contacts_relation values( 'Zaid', 'friend'),('sufiyan','family'),('Asma','work');
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from contacts_relation;
+-----------+--------+
| firstname | type   |
+-----------+--------+
| Zaid      | friend |
| sufiyan   | family |
| Asma      | work   |
+-----------+--------+
3 rows in set (0.00 sec)

mysql> insert into contacts_address values ('Zaid','590010');
Query OK, 1 row affected (0.02 sec)

mysql> insert into contacts_address values ('sufiyan,'590016');
    '> ;^C
mysql> insert into contacts_address values ('Sufiyan','590016');
Query OK, 1 row affected (0.01 sec)

mysql> insert into contacts_address values ('Asma','590016');
Query OK, 1 row affected (0.01 sec)

mysql> select * from contacts_address;
+-----------+--------+
| firstname | zip    |
+-----------+--------+
| Zaid      | 590010 |
| Sufiyan   | 590016 |
| Asma      | 590016 |
+-----------+--------+
3 rows in set (0.00 sec)

mysql> select count(contacts.firstname) from contacts,contacts_address,address where contacts.firstname = contacts_address.firstname and contacts_address.zip = address.zip and address.state = 'karnataka';
+---------------------------+
| count(contacts.firstname) |
+---------------------------+
|                         3 |
+---------------------------+
1 row in set (0.00 sec)

mysql> select type, Count(firstName) from contacts_relation group by type;
+--------+------------------+
| type   | Count(firstName) |
+--------+------------------+
| family |                1 |
| friend |                1 |
| work   |                1 |
+--------+------------------+
3 rows in set (0.00 sec)

mysql>