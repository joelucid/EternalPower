#!/bin/sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR
EPDIR="/Library/Application Support/EternalPower"
PLIST=/Library/LaunchDaemons/com.joelucid.EternalPower.epd.plist
if [ -f $PLIST ]; then
    /bin/launchctl unload $PLIST
fi
if [ ! -d "$EPDIR" ]; then
    /bin/mkdir "$EPDIR"
    /bin/chmod 755 "$EPDIR"
fi
/bin/cp epd "$EPDIR"
if [ ! -f "${EPDIR}/epd.conf" ]; then
    /bin/cp epd.conf "$EPDIR"
    /bin/chmod 666 "$EPDIR/epd.conf"
fi
if [ ! -f "${EPDIR}/epd.state" ]; then
    /bin/cp epd.state "$EPDIR"
    /bin/chmod 644 "$EPDIR/epd.state"
fi
/usr/bin/touch "$EPDIR/epd.log"
/bin/chmod 666 "$EPDIR/epd.log"
/bin/cp com.joelucid.EternalPower.epd.plist /Library/LaunchDaemons
/bin/launchctl load /Library/LaunchDaemons/com.joelucid.EternalPower.epd.plist
