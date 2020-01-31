while read LINE
do sudo ip addr add $LINE/24 dev ens3
curl https://172.18.0.179 -k -vvv --header "clientless-mode: 1" -u bob:bob --interface $LINE
curl https://172.18.0.179 -k -vvv --header "clientless-mode: 1" -u jim:jim --interface $LINE
curl https://172.18.0.179 -k -vvv --header "clientless-mode: 1" --interface $LINE
sudo ip addr del $LINE/24 dev ens3
done < ip_address.txt
