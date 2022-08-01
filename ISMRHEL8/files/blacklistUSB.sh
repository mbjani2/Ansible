#!/bin/bash

if ! grep -q "blacklist usb-storage" /etc/modprobe.d/blacklist.conf
then
  echo "blacklist usb-storage" >> /etc/modprobe.d/blacklist.conf
else
  echo "No Chane - USB is already disallowed"
fi
