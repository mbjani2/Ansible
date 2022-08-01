#!/bin/bash

#this must be executed as root

usbguard generate-policy > /etc/usbguard/rules.conf
systemctl enable usbguard.service
systemctl start usbguard.service
