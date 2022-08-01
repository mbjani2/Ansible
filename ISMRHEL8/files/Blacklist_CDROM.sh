#!/bin/bash

# this needs to be run as a root. Configure this in Ansible. 
if ! grep -q "blacklist st_mod" /etc/modprobe.d/blacklist.conf
then
  modprobe -r sr_mod
   echo "blacklist sr_mod" >> /etc/modprobe.d/local-dontload.conf
   echo "blacklist sr_mod" >> /etc/modprobe.d/blacklist.conf
   echo "install sr_mod /bin/false" >> /etc/modprobe.d/local-dontload.conf
   cp /boot/initramfs-$(uname -r).img /boot/initramfs-$(uname -r).img$(date +%m-%d-%H%M%S).bak
   dracut --omit-drivers sr_mod -f
   KERNELOPTS="$(grub2-editenv - list | grep kernelopts)"
   grub2-editenv - set "$KERNELOPTS module_name.blacklist=1 rd.driver.blacklist=sr_mod"
   cp /boot/initramfs-$(uname -r)kdump.img /boot/initramfs-$(uname -r)kdump.img.$(date +%m-%d-%H%M%S).bak
   sed -i '/^KDUMP_COMMANDLINE_APPEND=/s/"$/ rd.driver.blacklist=module_name"/' /etc/sysconfig/kdump
   kdumpctl restart
   mkdumprd -f /boot/initramfs-$(uname -r)kdump.img
else
  echo"No Change"
fi