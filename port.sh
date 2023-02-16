#!/bin/bash

read -p "Ports: " IN
separator=' ' read -ra ports <<< "$IN"

if [ "${#ports[@]}" == "0" ]; then
	echo "No Port Specified"
	exit
fi

addr='0.0.0.0'

remote=$(wsl -e ip addr | grep -Ee 'inet.*eth0')
ip=$(echo $remote | egrep -o '[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}\/' | egrep -o '[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}')

ports_a=""
for i in "${ports[@]}"; do
	ports_a+="$i,"
done
ports_a=${ports_a:0:-1}

echo iex "'Remove-NetFireWallRule -DisplayName \"WSL 2 Firewall Unlock\"'" | powershell -Command -

echo iex "'New-NetFireWallRule -DisplayName \"WSL 2 Firewall Unlock\" -Direction Outbound -LocalPort $ports_a -Action Allow -Protocol TCP'" | powershell -Command -
echo iex "'New-NetFireWallRule -DisplayName \"WSL 2 Firewall Unlock\" -Direction Inbound -LocalPort $ports_a -Action Allow -Protocol TCP'" | powershell -Command -

for port in "${ports[@]}"; do
	powershell -Command "netsh interface portproxy delete v4tov4 listenport=$port listenaddress=$addr" 2>/dev/null
	powershell -Command "netsh interface portproxy add v4tov4 listenport=$port listenaddress=$addr connectport=$port connectaddress=$remoteport"
done

read -p "(Press Enter to Exit)" ENTER
