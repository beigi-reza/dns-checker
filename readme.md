# DNS Checkers (dig+)

for Perform a quick DNS propagation lookup for any hostname, and check DNS data collected from all available DNS Servers to confirm that the DNS records are fully propagated

## Edit `DNSFileList` variable

replace `<DNSFileList>` with Realpath of **dnslist.txt**

## Run 

```
./dnscheckes.sh <DNSname>
```

## Update DNS List

update `dnslist.txt` File



Syntax: `----Location----`:`----company----`:`----IP-----`
        


>This script uses dig command, this command is available by default on most Linux distributions. If it is not present in your operating system, you need to install it first

## Install dig Command

### Red Hat Linux /CentOS

```bash
dnf install bind-utils
```

### Debian / Ubuntu
```bash
apt install dnsutils
```

### ArchLinux
```bash
pacman -Sy dnsutils
```



