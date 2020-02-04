Simple ansible playbook to run against an ubuntu server host to get a simple application using docker.  

app-server.yml playbook does the following:  
-installs python (to accomodate ansible)  
-installs docker (default through apt)  
-install pip (through apt)  
-install docker-py (through pip)  
-starts dvwa after downloading from dockerhub  


note that this works with a rather ancient version ansible (2.5) and may need rework

https://github.com/ansible/workshops/tree/master/exercises/ansible_f5/3.2-as3-delete
 for more information

https://clouddocs.f5.com/products/extensions/f5-appsvcs-extension/latest/declarations/access-related.html#referencing-existing-access-and-connectivity-profiles  
for access policy insertion w/as3

big-ip.yml pushes an APM profile in the ./artifact folder to the BIG-IP in the inventory - please note that:  
profile_Common_simple_policy.conf.tar.gz was exported from a 15.1 machine  
profile_Common_simpleHttpsAccess.conf.tar was exported from a 13.1 BIG-IP in the BIG-IQ lab  

as3.yml uses a the jinja files in the j2 diretory to spin up a simple application (IP addresses are provided in the in inventory) with AS3  

as3_delete.yml removes the application deployed via as3 above   

client-machine.yml deploys the script the load-script.sh script and the ip_address.txt to a client machine for traffic simulation to the BIG-IP  

./artifact/load_script.sh is a bash script that reads the ip address in the ip_address.txt file to:  
-add the address read from the list to the client machine interface  
-generate connections to the BIG-IP VS using the newly configured interface with different credentials  
-remove the address from the client machine interface  
-repeat the above process with the next ip address in the ip_address.txt file  

more to come - 

the aim of these scripts is to create a fully functional demo of BIG-IP APM with as simple application providing simulated traffic to build graphs and other statistics on BIG-IP and BIG-IQ.