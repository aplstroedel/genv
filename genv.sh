#!/usr/bin/env bash
OPTIND=1
while getopts "h:t:c:" options
do
 case "$options" in
        h) host=$OPTARG;;
        t) targets=($OPTARG);;
        c) command=$OPTARG;;
 esac
done

if [[ "$command" == 'startall' ]]
then
 ssh "$host" "LIBVIRT_DEFAULT_URI=qemu:///system /home/$USER/scripts/ssh-virsh/startall"
elif [[ "$command" == 'stopall' ]]
then
 ssh "$host" "LIBVIRT_DEFAULT_URI=qemu:///system /home/$USER/scripts/ssh-virsh/stopall"
elif [[ "$command" == 'status' ]]
then
 ssh "$host" "LIBVIRT_DEFAULT_URI=qemu:///system /home/$USER/scripts/ssh-virsh/status"
elif [[ "$command" == 'rstart' ]]
then
 ssh "$host" "LIBVIRT_DEFAULT_URI=qemu:///system /home/$USER/scripts/ssh-virsh/rstart ${targets[@]}"
elif [[ "$command" ==  'rstop' ]]
then
 ssh "$host" "LIBVIRT_DEFAULT_URI=qemu:///system /home/$USER/scripts/ssh-virsh/rstop ${targets[@]}"
elif [[ "$command" == 'rreboot' ]]
then
 ssh "$host" "LIBVIRT_DEFAULT_URI=qemu:///system /home/$USER/scripts/ssh-virsh/rreboot ${targets[@]}"
fi
