for ip in $(seq 1 254); do ping -c 1 -W 1 192.168.1.$ip | grep "ttl"; done
