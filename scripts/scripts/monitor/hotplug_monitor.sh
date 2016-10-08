#!/bin/bash
#triggered from /etc/udev/rules.d/96-monitor.rules

echo "ACTION: ${ACTION}" >> /var/log/hotplug.log
echo "KERNEl: ${KERNEL}" >> /var/log/hotplug.log

if grep -qw disconnected  /sys/devices/pci0000:00/0000:00:02.0/drm/card0/card0-DP-1/status ; then 
	echo "disconnected" >> /var/log/hotplug.log
	sleep 1
	/usr/bin/pkill -KILL xfdesktop
fi

