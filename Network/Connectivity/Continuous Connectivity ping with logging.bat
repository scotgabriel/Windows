@echo off
echo !!!!!!!!!!!!!!!!!!!!!!!!!! >> c:\services\ping-vpn.txt
echo !!!!!!!!!!BOOTED!!!!!!!!!! >> c:\services\ping-vpn.txt
echo Start Ping: %date% @%time% >> c:\services\ping-vpn.txt

echo !!!!!!!!!!!!!!!!!!!!!!!!!! >> c:\services\ping-google.txt
echo !!!!!!!!!!BOOTED!!!!!!!!!! >> c:\services\ping-google.txt
echo Start Ping: %date% @%time% >> c:\services\ping-google.txt


:LOOP
ping -n 120 www.google.com >> c:\services\ping-google.txt
ping -n 120 vpn-ip.domain.com >> c:\services\ping-vpn.txt
echo Loop Ping: %date% @%time% >> c:\services\ping-vpn.txt
echo Loop Ping: %date% @%time% >> c:\services\ping-google.txt
GOTO LOOP