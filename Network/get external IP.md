

## CURL based

### ifconfig.io

`curl https://ifconfig.io`

### whatismyIP.com

`curl https://whatismyip.com


## NSLOOKUP based

### Opendns

#### Simple

```
nslookup myip.opendns.com resolver1.opendns.com
```

#### Greped <linux>

```
nslookup myip.opendns.com resolver1.opendns.com | grep -m2 -oE "\b([0-9]{1,3}.){3}[0-9]{1,3}\b" | tail -n1
```

### Google

#### Simple

```
nslookup -query=TXT o-o.myaddr.l.google.com ns1.google.com
```

#### Greped <linux>

```
nslookup -query=TXT o-o.myaddr.l.google.com ns1.google.com | grep -m2 -oE "\b([0-9]{1,3}.){3}[0-9]{1,3}\b" | tail -n1
```

## WGET

### ipaddr.pub

`wget ipaddr.pub/cli`

### ipecho.net

`wget http://ipecho.net/plain`

### icanhazip.com

`wget icanhazip.com`