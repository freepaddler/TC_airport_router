#!/bin/sh
### Start script, launches the process chain
### place or softlink to /mnt/Flash/rc.local

. /mnt/Flash/tc/include

lg "Request run setup.sh"

# on restart kill all custom running processes (NOT dhcp!)
for f in $RUNDIR/*; do
    if [ -e "$f" ]; then
        lg "killing $f"
        kill $(cat "$f")
        rm -f "$f"
    fi
done;

# launch interface changes watcher process
# on the start time it checks unterface state
# if UP - calls up scripts (-u option)
lg "Start ifwatchd bridge0 bcmeth1"
/usr/sbin/ifwatchd -u "$BASE/bin/if-up.sh" -d "$BASE/bin/if-down.sh" bridge0 bcmeth1 
sleep 1
# save pid in file
 ps x -o pid,command | sed -nr 's|(([^ ]+ ){1})/usr/sbin/ifwatchd.*|\1|p' > "$RUNDIR/ifwatchd.pid"

lg "Complete run setup.sh"

exit 0
