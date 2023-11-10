# Redeemer

> Task 1 -  Which TCP port is open on the machine? 

```
6379
```

> Task 2 -  Which service is running on the port that is open on the machine? 

```
redis
```

> Task 3 - What type of database is Redis? Choose from the following options: (i) In-memory Database, (ii) Traditional Database

```
In-memory Database
```

> Task 4 - Which command-line utility is used to interact with the Redis server? Enter the program name you would enter into the terminal without any arguments.

```
redis-cli
```

> Task 5 - Which flag is used with the Redis command-line utility to specify the hostname?

```
-h
```

> Task 6 - Once connected to a Redis server, which command is used to obtain the information and statistics about the Redis server?

```
info
```

> Task 7 - What is the version of the Redis server being used on the target machine?

```
5.0.7
```

> Task 8 -  Which command is used to select the desired database in Redis?

```
select
```

> Task 9 -  How many keys are present inside the database with index 0?
#### Output
```
10.129.238.241:6379> info keyspace
# Keyspace
db0:keys=4,expires=0,avg_ttl=0
```
```
4
```

> Task 10 -  Which command is used to obtain all the keys in a database?

```
KEYS *
```

> Submit root flag

#### Output
```
10.129.238.241:6379> get flag
"03e1d2b376c37ab3f5319922053953eb"
```

```
HTB{03e1d2b376c37ab3f5319922053953eb}
```

