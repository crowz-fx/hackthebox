# Fawn

> Task 1 - What does the 3-letter acronym FTP stand for? 

```
File transfer protocol
```

> Task 2 -  What communication model does FTP use, architecturally speaking? 

```
client-server model
```

> Task 3 -  What is the name of one popular GUI FTP program? 

```
Filezilla
```

> Task 4 -  Which port is the FTP service active on usually? 

```
21 tcp
```

> Task 5 -  What acronym is used for the secure version of FTP? 

```
SFTP
```

> Task 6 -  What is the command we can use to test our connection to the target?/ 

```
ping
```

> Task 7 -  From your scans, what version is FTP running on the target? 

```
vsftpd 3.0.3
```

> Task 8 - From your scans, what OS type is running on the target? 

```
unix
```

> Submit root flag
```
sftp $IP
user: anonymous
pass: <blank>
get flag.txt
```

```
HTB{035db21c881520061c53e0536e44f815}
```