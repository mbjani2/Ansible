# Log into the Qualys Cloud platform and select CA dor the Cloud Agent Module. 
# Select an activation key and selece Install Agent from Quick Action Menu. Am agent will be downloaded. 
# From Qualys-cloud-agent installation guide -> Steps to install Agents
# call the .rpm package downloaded in the above stop and run the following commands. 

sudo rpm -ivh qualys-cloud-agent.x86_64.rpm

sudo /usr/local/qualys/cloud-agent/bin/qualys-cloud-agent.sh
ActivationId=XXXXXXXXX # Replace the Activation Id
CustomerId=XXXXX # Replace the customer ID

