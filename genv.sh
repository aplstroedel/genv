#!/usr/bin/env bash
OPTIND=1
while getopts "h:t:c:i" options
do
 case "$options" in
        h) host='qemu+ssh://'"$OPTARG"'/system';;
        t) targets=($(echo "${OPTARG[@]//,/ }"));;
        c) command="$OPTARG";;
	i) info=true
 esac
done
if [[ "$command" == 'startall' ]]
then
 for i in $(virsh -c "$host" list --all --name)
 do
   virsh -c "$host" start "$i"
 done
elif [[ "$command" == 'stopall' ]]
then
 for i in $(virsh -c "$host" list --all --name)
 do
   virsh -c "$host" shutdown "$i" --mode acpi
 done
elif [[ "$command" == "rebootall" ]]
then
  for i in $(virsh -c "$host" list --all --name)
 do
   virsh -c "$host" reboot "$i" --mode acpi
 done
elif [[ "$command" == 'status' ]]
then
 virsh -c "$host" list --all
elif [[ "$command" == 'start' ]]
then
 for i in "${targets[@]}"
 do
   virsh -c "$host" start "$i"
 done
elif [[ "$command" ==  'stop' ]]
then
 for i in "${targets[@]}"
 do
   virsh -c "$host" shutdown "$i" --mode acpi
 done
elif [[ "$command" == 'reboot' ]]
then
 for i in "${targets[@]}"
 do
   virsh -c "$host" reboot "$i" --mode acpi
 done
elif [[ "$info" ]]
then
 echo -e "howto:\n\n
  start all vms: ./genv.sh -h [user@server] -c startall\n
  shutdown all vms: ./genv.sh -h [user@server] -c stopall\n
  reboot all vms: ./genv.sh -h [user@server] -c rebootall\n
  print status of all vms: ./genv.sh -h [user@server] -c status\n
  start random chosen vms: ./genv.sh -h [user@server] -c rstart -t vm1,vm2,vm3\n
  stop random chosen vms: ./genv.sh -h [user@server] -c rstop -t vm1,vm2,vm3\n
  reboot random chosen vms: ./genv.sh -h [user@server] -c rreboot -t vm1,vm2,vm3\n
"
else
 echo 'not an option'
fi
