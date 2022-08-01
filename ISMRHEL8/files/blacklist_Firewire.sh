#!/bin/bash

#This must be executed as root

if ! grep -q "blacklist firewire-ohci" /etc/modprobe.d/blacklist.conf
then
  echo "blacklist firewire-ohci" >> /etc/modprobe.d/blacklist.conf
  echo "blacklist firewire-sbp2" >> /etc/modprobe.d/blacklist.conf
  echo "blacklist firewire-core" >> /etc/modprobe.d/blacklist.conf
else
  echo "Firewire is already disallowed"
fi