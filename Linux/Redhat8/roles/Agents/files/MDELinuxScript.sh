#!/bin/bash

#install yum-uils if it isn't installed yet:

sudo yum install yum-utils

#In the following commands, replace [version] and [channel: insider-fast, insider-slow or prod] with the information you've identified:
sudo yum-config-manager --add-repo=https://packages.microsoft.com/config/rhel/8/prod.repo

#Install the Microsoft GPG public key:
sudo rpm --import http://packages.microsoft.com/keys/microsoft.asc

#Application Installation. RHEL and variants
sudo yum install mdatp -y

# To list repositories, use yum repolist and check if following two repos are in the list

#packages-microsoft-com-prod               packages-microsoft-com-prod   
#packages-microsoft-com-prod-insiders-fast packages-microsoft-com-prod-ins

# install the package from the production repository
sudo yum --enablerepo=packages-microsoft-com-prod install mdatp


# Download the onboarding package

#In the Microsoft 365 Defender portal, go to Settings > Endpoints > Device management > Onboarding.

#In the first drop-down menu, select Linux Server as the operating system. In the second drop-down menu, select Local Script as the deployment method.

#Select Download onboarding package. Save the file as WindowsDefenderATPOnboardingPackage.zip.

# Install zip utility as it's not in by default

sudo yum install zip unzip -y

# Unzip the file
unzip WindowsDefenderATPOnboardingPackage.zip

# Client Configuration
# Run MicrosoftDefenderATPOnboardingLinuxServer.py.For RHEL 8.x ot Ubuntu 20.04 or higher, use python3.
# For rest of the distro, use python
sudo python3 MicrosoftDefenderATPOnboardingLinuxServer.py