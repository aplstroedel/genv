#!/usr/bin/env bash
OPTIND=1
while getopts "h:t:c:" options
do
 case "$options" in
        h) host='qemu+ssh://'"$OPTARG"'/system';;
        t) targets=($(echo "${OPTARG[@]/,/ }"));;
        c) command="$OPTARG";;
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
elif [[ "$command" == 'rstart' ]]
then
 for i in "${targets[@]}"
 do
   virsh -c "$host" start "$i"
 done
elif [[ "$command" ==  'rstop' ]]
then
 for i in "${targets[@]}"
 do
   virsh -c "$host" shutdown "$i" --mode acpi
 done
elif [[ "$command" == 'rreboot' ]]
then
 for i in "${targets[@]}"
 do
   virsh -c "$host" reboot "$i" --mode acpi
 done
fi
