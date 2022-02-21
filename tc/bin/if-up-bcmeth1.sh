#!/bin/sh
### PUBLIC interface UP

. /mnt/Flash/tc/include

# save public IP address
set_var TC_PUB $4
# setup tunnels
lg "Setup tunnels"
"$BASE/bin/tunnels.sh"
# update dns $ZONE record with $TC_PUB ip
lg "Set dns record $ZONE $TC_PUB"
"$BASE/bin/dns.sh" configure

exit 0
