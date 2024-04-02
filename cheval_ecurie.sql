Enter password: ******************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 30
Server version: 8.0.19 MySQL Community Server - GPL

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases ;
+--------------------+
| Database           |
+--------------------+
| bdvol              |
| centre_formation   |
| chevaux_ecurie     |
| djallabasoft       |
| hollywood          |
| information_schema |
| isgi               |
| mysql              |
| newschema          |
| performance_schema |
| sakila             |
| stu                |
| sys                |
| test1              |
| test2              |
| test3              |
+--------------------+
16 rows in set (0.34 sec)

mysql> use chevaux_ecurie ;
Database changed
mysql> show tables ;
+--------------------------+
| Tables_in_chevaux_ecurie |
+--------------------------+
| cheval                   |
| concours                 |
| croissance               |
| participer               |
| personne                 |
| propretaire              |
| race                     |
+--------------------------+
7 rows in set (0.09 sec)

mysql>  desc race ;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| idrace | varchar(20) | NO   | PRI | NULL    |       |
| poid   | int         | YES  |     | NULL    |       |
| taille | int         | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql>  desc cheval ;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| IDC         | int         | NO   | PRI | NULL    |       |
| nomch       | varchar(10) | YES  |     | NULL    |       |
| couleur     | varchar(10) | YES  |     | NULL    |       |
| IDC_mere    | int         | YES  | MUL | NULL    |       |
| IDC_pere    | int         | YES  | MUL | NULL    |       |
| idElevateur | int         | YES  | MUL | NULL    |       |
| idrace      | varchar(20) | YES  | MUL | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> select * from cheval where couleur="noire";
Empty set (0.13 sec)

mysql> select * from cheval where couleur="noir";
+-----+-------+---------+----------+----------+-------------+----------+
| IDC | nomch | couleur | IDC_mere | IDC_pere | idElevateur | idrace   |
+-----+-------+---------+----------+----------+-------------+----------+
|   2 | cisco | noir    |     NULL |     NULL |           1 | Palomino |
|   3 | artax | noir    |        2 |        1 |           1 | ARABIAN  |
+-----+-------+---------+----------+----------+-------------+----------+
2 rows in set (0.00 sec)

mysql> select count() from cheval where race ="agloarabe";
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ') from cheval where race ="agloarabe"' at line 1
mysql> SELECT COUNT(*) FROM cheval WHERE race = 'agloarabe';
ERROR 1054 (42S22): Unknown column 'race' in 'where clause'
mysql> SELECT COUNT(*) FROM cheval
    -> WHERE id_race ="agloarabe";
ERROR 1054 (42S22): Unknown column 'id_race' in 'where clause'
mysql> SELECT COUNT(*) FROM cheval
    -> WHERE idrace ="agloarabe";
+----------+
| COUNT(*) |
+----------+
|        0 |
+----------+
1 row in set (0.05 sec)

mysql> show tables;
+--------------------------+
| Tables_in_chevaux_ecurie |
+--------------------------+
| cheval                   |
| concours                 |
| croissance               |
| participer               |
| personne                 |
| propretaire              |
| race                     |
+--------------------------+
7 rows in set (0.00 sec)

mysql> desc propretaire ;
+-------+------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+-------+------+------+-----+---------+-------+
| IDP   | int  | YES  | MUL | NULL    |       |
| IDC   | int  | YES  | MUL | NULL    |       |
| prix  | int  | YES  |     | NULL    |       |
| date  | date | YES  |     | NULL    |       |
+-------+------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> desc croissance ;
+--------+------+------+-----+---------+-------+
| Field  | Type | Null | Key | Default | Extra |
+--------+------+------+-----+---------+-------+
| idcr   | int  | NO   | PRI | NULL    |       |
| mois   | int  | YES  |     | NULL    |       |
| taille | int  | YES  |     | NULL    |       |
| poidcr | int  | YES  |     | NULL    |       |
| idc    | int  | YES  | MUL | NULL    |       |
+--------+------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> desc concours;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| nomC   | varchar(10) | NO   | PRI | NULL    |       |
| annec  | year        | NO   | PRI | NULL    |       |
| nbrpar | int         | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> insert into concours values
    -> ( "dubai" , 2018 , 300),
    -> ( "dubai" , 2019 , 330),
    -> ( "dubai" , 2020 , 290);
Query OK, 3 rows affected (0.15 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT COUNT(*) FROM concours
    -> where nomc="dubai";
+----------+
| COUNT(*) |
+----------+
|        3 |
+----------+
1 row in set (0.00 sec)

mysql> select sum(nbrpar) from concours
    -> where nomc="dubai";
+-------------+
| sum(nbrpar) |
+-------------+
|         920 |
+-------------+
1 row in set (0.03 sec)

mysql> show tables;
+--------------------------+
| Tables_in_chevaux_ecurie |
+--------------------------+
| cheval                   |
| concours                 |
| croissance               |
| participer               |
| personne                 |
| propretaire              |
| race                     |
+--------------------------+
7 rows in set (0.00 sec)

mysql> desc participer;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| IDC   | int         | YES  | MUL | NULL    |       |
| nomc  | varchar(10) | YES  | MUL | NULL    |       |
| annec | year        | YES  |     | NULL    |       |
| place | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> insert into participer values
    -> (1 , ^C
mysql> select * from cheval;
+-----+---------+---------+----------+----------+-------------+---------------+
| IDC | nomch   | couleur | IDC_mere | IDC_pere | idElevateur | idrace        |
+-----+---------+---------+----------+----------+-------------+---------------+
|   1 | sperit  | jaune   |     NULL |     NULL |        NULL | ARABIAN       |
|   2 | cisco   | noir    |     NULL |     NULL |           1 | Palomino      |
|   3 | artax   | noir    |        2 |        1 |           1 | ARABIAN       |
|   4 | vega    | jaune   |        2 |        1 |           1 | ARABIAN       |
|   5 | rain    | blanc   |        4 |     NULL |           1 | FRIESTAN      |
|   6 | thunder | gris    |        4 |     NULL |           1 | KIGER MUSTANG |
+-----+---------+---------+----------+----------+-------------+---------------+
6 rows in set (0.00 sec)

mysql> insert into participer values
    -> (1 , "dubai" , 2018 , 1),
    -> (2 , "dubai" , 2018 , 9),
    -> (3 , "dubai" , 2019 , 2),
    -> (4 , "dubai" , 2019 , 1);
Query OK, 4 rows affected (0.16 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select nomc , annec from participer
    -> where place=1 ;
+-------+-------+
| nomc  | annec |
+-------+-------+
| dubai |  2018 |
| dubai |  2019 |
+-------+-------+
2 rows in set (0.00 sec)

mysql> select nomch
    -> ^C
mysql> desc cheval ;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| IDC         | int         | NO   | PRI | NULL    |       |
| nomch       | varchar(10) | YES  |     | NULL    |       |
| couleur     | varchar(10) | YES  |     | NULL    |       |
| IDC_mere    | int         | YES  | MUL | NULL    |       |
| IDC_pere    | int         | YES  | MUL | NULL    |       |
| idElevateur | int         | YES  | MUL | NULL    |       |
| idrace      | varchar(20) | YES  | MUL | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> select nomch
    -> where idc in (select idc where nomc="londres" and annec=2018);
ERROR 1054 (42S22): Unknown column 'nomch' in 'field list'
mysql> select nomch from cheval
    -> where idc in (select idc from participer where nomc="londres" and annec=2018);
Empty set (0.00 sec)

mysql> desc personne ;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| IDP      | int         | NO   | PRI | NULL    |       |
| nom      | varchar(20) | YES  |     | NULL    |       |
| prenom   | varchar(20) | YES  |     | NULL    |       |
| fonction | varchar(20) | YES  |     | NULL    |       |
| adress   | varchar(40) | YES  |     | NULL    |       |
| tel      | int         | YES  |     | NULL    |       |
| idsup    | int         | YES  | MUL | NULL    |       |
+----------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> select count(*) from personne where fonction ="proprietaire";
+----------+
| count(*) |
+----------+
|        4 |
+----------+
1 row in set (0.08 sec)

mysql> show tables;
+--------------------------+
| Tables_in_chevaux_ecurie |
+--------------------------+
| cheval                   |
| concours                 |
| croissance               |
| participer               |
| personne                 |
| propretaire              |
| race                     |
+--------------------------+
7 rows in set (0.00 sec)

mysql> desc propretaire ;
+-------+------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+-------+------+------+-----+---------+-------+
| IDP   | int  | YES  | MUL | NULL    |       |
| IDC   | int  | YES  | MUL | NULL    |       |
| prix  | int  | YES  |     | NULL    |       |
| date  | date | YES  |     | NULL    |       |
+-------+------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> select nom from personne
    -> where idp in (select idp from propretaire^C
mysql> select count(*) from personne
    -> where idp in(select idp from propretaire  where date =2018);
+----------+
| count(*) |
+----------+
|        0 |
+----------+
1 row in set, 1 warning (0.06 sec)

mysql> select sum(prix) from personne
    -> where idp in(select idp from propretaire  where date =2018);
ERROR 1054 (42S22): Unknown column 'prix' in 'field list'
mysql> select sum(prix) from propetaire
    -> where idp = 6;
ERROR 1146 (42S02): Table 'chevaux_ecurie.propetaire' doesn't exist
mysql> select sum(prix) from propretaire
    -> where idp = 6;
+-----------+
| sum(prix) |
+-----------+
|   1021553 |
+-----------+
1 row in set (0.02 sec)

mysql> select * from propretaire ;
+------+------+--------+------------+
| IDP  | IDC  | prix   | date       |
+------+------+--------+------------+
|    1 |    1 |   3455 | 2020-12-12 |
|    2 |    1 |   6778 | 2021-01-13 |
|    3 |    1 |    677 | 2021-08-13 |
|    4 |    1 |   3000 | 2021-11-04 |
|    2 |    2 |   6778 | 2020-01-13 |
|    3 |    2 |  62277 | 2021-08-13 |
|    4 |    2 |   9876 | 2022-03-05 |
|    1 |    2 |   6778 | 2019-01-13 |
|    1 |    3 |   3563 | 2020-01-13 |
|    2 |    3 |   4000 | 2020-11-29 |
|    3 |    3 |  43000 | 2021-03-08 |
|    4 |    3 |   4700 | 2021-07-24 |
|    1 |    4 |  30000 | 2023-02-14 |
|    2 |    4 |  30000 | 2023-09-10 |
|    3 |    4 |  30000 | 2023-11-17 |
|    4 |    4 |  30000 | 2024-02-01 |
|    5 |    5 |  45677 | 2022-04-16 |
|    6 |    5 | 565876 | 2022-11-22 |
|    5 |    6 |   4567 | 2022-07-16 |
|    6 |    6 | 455677 | 2022-11-02 |
+------+------+--------+------------+
20 rows in set (0.00 sec)

mysql>