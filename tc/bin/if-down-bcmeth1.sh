#!/bin/sh
### PUBLIC interface DOWN

. /mnt/Flash/tc/include

# remove tunnels, because if any gif
# interface exist on UP event, TC light
# will stay amber until gif is destroyed
lg "Remove tunnels"
"$BASE/bin/tunnels.sh" remove