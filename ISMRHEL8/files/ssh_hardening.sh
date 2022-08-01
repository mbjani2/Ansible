#!/bin/bash

funcHardenOS () {
    # ISM Control 1428 - Disabling IPv6
    #echo -e "net.ipv6.conf.all.disable_ipv6=1" >> /etc/sysctl.conf
    #echo -e "net.ipv6.conf.default.disable_ipv6=1" >> /etc/sysctl.conf

    # Set Maximum Authentication try to 3
    sed -i 's/#MaxAuthTries 6/MaxAuthTries 3/g' /etc/ssh/sshd_config
    #Set Maximum Session to 5
    sed -i 's/#MaxSessions 10/MaxSessions 5/g' /etc/ssh/sshd_config
    #Set Compression to no
    sed -1 's/#Compression delayed/Compression no' /etc/ssh/sshd_config
    #Set AgentForwarding to no
    sed -i 's/#AllowAgentForwarding yes/AllowAgentForwarding no/g' /etc/ssh/sshd_config
    #Set PermitRootLogin to no
    sed - i 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
    #Set ClientAliveInterval to 600
    sed -i 's/ClientAliveInterval 180/ClientAliveInterval 600/g' /etc/ssh/sshd_config
    #Set TCP Forwarding to no
    sed -i 's/#AlloeTcpForwarding yes/AllowTcpForwarding no/g' /etc/ssh/sshd_config
    #Set PasswordAuthentication to no
    sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
    #Disallow root login
    sed -i 's/#PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config


    
    

    #Need 3072 minimum RSA Key Size 
    echo "min_rsa_size = 3072" > /etc/crypto-policies/policies/modules/RSA-SIZE.pmod
}