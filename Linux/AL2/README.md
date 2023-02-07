# Ansible Collection - Linux.Redhat8

Documentation for the collection.

These roles must be applied with the root user. So please configure the ansible inventory file and VM accordingly. 

ISM role and deploy agent role must be implemented before the CIS role. Otherwise system will be locked out and Tasks within the ISM role will fail. 

Deploy Agents role has not been included in the main.yml file as there are no installation package/python script available yet. 

Please fill the relevant information in MDElinux.sh, mcafee.sh in files.

LogAnalytics and Qualys agent must be downloaded. 

mcafee.sh is empty as the licencing process has not been completed yet.

# How to execute the collection

Before running the collection playbook, please edit the 'hosts" in playbook/main.yml. Once done, run the playbook with following command

ansible-playbook Linux.AL2.main.yml