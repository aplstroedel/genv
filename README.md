# genv
virsh wrapper

instructions:
- git clone https://github.com/aplstroedel/genv.git
- cd ./genv
- chmod +x ./genv.sh

howto:
- start all vms: ./genv.sh -h [user@server] -c startall
- shutdown all vms: ./genv.sh -h [user@server] -c stopall
- reboot all vms: ./genv.sh -h [user@server] -c rebootall
- print status of all vms: ./genv.sh -h [user@server] -c status
- start random chosen vms: ./genv.sh -h [user@server] -c start -t vm1,vm2,vm3
- stop random chosen vms: ./genv.sh -h [user@server] -c stop -t vm1,vm2,vm3
- reboot random chosen vms: ./genv.sh -h [user@server] -c reboot -t vm1,vm2,vm3
