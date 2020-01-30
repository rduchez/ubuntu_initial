Simple ansible playbook to run against an ubuntu server host to get a simple application using docker.  

Playbook does the following:  
-installs python (to accomodate ansible)  
-installs docker (default through apt)  
-install pip (through apt)  
-install docker-py (through pip)  
-starts dvwa after downloading from dockerhub  


note that this works with a rather ancient version ansible (2.5) and may need rework