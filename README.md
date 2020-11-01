# fwgather
FWgather is a free tool for Check Point Firewall Administrators to gather system information quickly. This tool was created by Shield 7 Consulting to help Check Point customers gather data from their Firewalls for troubleshooting. This tools is provided under the GNU License and Shield 7 offers no warranty and Shield 7 is not responsible for any damage caused by the tool.

The tool is a simple shell script that automatically creates a directory on the firewall and runs numerous troublshoting commands and records their output to be reviewed.  We created this tool so Firewall administrators can gather a bunch of Check Point specific data quickly withut having to remember all the commands. This is also useful for scenarios where an Administrator needs to gather data quickly prior to having to reboot a gateway and risk losing some relevant logs. 

From expert mode ./firewall-gatherv1.1.sh
The tool will create a directory under /varlog/ named after the Firewall's hostname and place everything in this new directory. 
