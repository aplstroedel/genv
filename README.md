# genv
control virsh over ssh 

instructions:
- git clone https://github.com/aplstroedel/genv.git
- cd ./genv
- chmod +x ./genv
- copy ssh-virsh.tar.gz to your server

on the server:
- make sure you have a folder scripts in your home directory
- tar -C /home/$USER/scripts/ -xvfz ssh-virsh.tar.gz
- chmod -R +x /home/$USER/scripts/ssh-virsh/*

howto:
- start all vms: ./genv -h [user@server] -c startall
- shutdown all vms: ./genv -h [user@server] -c stopall
- print status of all vms: ./genv -h [user@server] -c status
- start random chosen vms: ./genv -h [user@server] -c rstart -t 'vm1 vm2 vm3'
- stop random chosen vms: ./genv -h [user@server] -c rstop -t 'vm1 vm2 vm3'
- reboot random chosen vms: ./genv -h [user@server] -c rreboot -t 'vm1 vm2 vm3'
