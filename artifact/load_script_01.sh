# usage:  load_script_01.sh <virtual server IP address>
# 


while read LINE
do sudo ip addr add $LINE/24 dev ens4
echo "connecting from $LINE"
echo "*********************"
curl https://$@ -k -vvv --header "clientless-mode: 1" -u marco:marco --interface $LINE
sleep 5
curl https://$@ -k -vvv --header "clientless-mode: 1" -u david:david --interface $LINE
sleep 5
curl https://$@ -k -vvv --header "clientless-mode: 1" --header "fNE" -u larry:larry
sleep 5
sudo ip addr del $LINE/24 dev ens4
done < ip_address.txt
