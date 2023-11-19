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