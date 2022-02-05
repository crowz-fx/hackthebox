# Snippets
Contains handy commands and code snippets for use...

## NMAP Scanning
```
sudo nmap -sS -sV -sC -oA nmap/<filename> $IP
```

## Get source for URL

```
CRTL + U
```

## Gobuster

### Iterate over directories
```
gobuster dir -u http://$IP/ -o gobust.out -w {wordlist}
```

## MySQL

### Connect to database

```
mysql -h $IP -u $USER
```