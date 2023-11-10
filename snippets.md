# Snippets
Contains handy commands and code snippets for use...

## Nmap Scanning
```
# Add -p- for all 65535 ports
sudo nmap -sS -sV -sC -oA nmap/<filename> $IP
```

## Get source for URL

```
CRTL + U
```

## GoBuster

### Iterate over directories
```
gobuster dir -u http://$IP/ -o gobust.out -w {wordlist}
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