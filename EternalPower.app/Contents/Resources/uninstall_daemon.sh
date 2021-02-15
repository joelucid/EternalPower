#!/bin/sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR
EPDIR="/Library/Application Support/EternalPower"
PLIST=/Library/LaunchDaemons/com.joelucid.EternalPower.epd.plist
if [ -f $PLIST ]; then
    /bin/launchctl unload $PLIST
    /bin/rm $PLIST
fi
