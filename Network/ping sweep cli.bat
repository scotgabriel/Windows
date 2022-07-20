FOR /L %i IN (1,1,254) DO ping -n 1 192.168.1.%i | find /i "TTL"
