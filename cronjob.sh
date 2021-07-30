#! /bin/bash


# sudo ipset create tms-itw_voip-allowed hash:net
# curl https://raw.githubusercontent.com/it-world/ipblocker/main/allwaysallowed_voip_ips.txt | iprange | while read line; do ipset add tms-itw_voip-allowed $line; done
# sudo iptables -I INPUT 12 -m state --state NEW -p tcp -m set --match-set tms-itw_voip-allowed src -j ACCEPT
#
URL="https://raw.githubusercontent.com/it-world/ipblocker/main/allwaysallowed_voip_ips.txt"
BLOCKLIST=tms-itw_voip-allowed
curl $URL | iprange | while read line; do ipset add $BLOCKLIST $line; done



# sudo ipset create firehol_webserver hash:net
# curl https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/firehol_webserver.netset | iprange | while read line; do ipset add firehol_webserver $line; done
# sudo iptables -I INPUT 13 -m state --state NEW -p tcp -m set --match-set firehol_webserver src -j REJECT --reject-with tcp-reset
#
URL="https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/firehol_webserver.netset"
BLOCKLIST=firehol_webserver
curl $URL | iprange | while read line; do ipset add $BLOCKLIST $line; done


# sudo ipset create firehol_sip hash:net
# curl http://lists.blocklist.de/lists/sip.txt | iprange | while read line; do ipset add firehol_sip $line; done
# sudo iptables -I INPUT 13 -m state --state NEW -p tcp -m set --match-set firehol_sip src -j REJECT --reject-with tcp-reset
#
URL="http://lists.blocklist.de/lists/sip.txt"
BLOCKLIST=firehol_sip
curl $URL | iprange | while read line; do ipset add $BLOCKLIST $line; done


# sudo ipset create firehol_ssh hash:net
# curl http://lists.blocklist.de/lists/ssh.txt | iprange | while read line; do ipset add firehol_ssh $line; done
# sudo iptables -I INPUT 13 -m state --state NEW -p tcp -m set --match-set firehol_ssh src -j REJECT --reject-with tcp-reset
#
URL="http://lists.blocklist.de/lists/ssh.txt"
BLOCKLIST=firehol_ssh
curl $URL | iprange | while read line; do ipset add $BLOCKLIST $line; done


# sudo ipset create firehol_voipbl hash:net
# curl http://www.voipbl.org/update/ | iprange | while read line; do ipset add firehol_voipbl $line; done
# sudo iptables -I INPUT 13 -m state --state NEW -p tcp -m set --match-set firehol_voipbl src -j REJECT --reject-with tcp-reset
#
URL="http://www.voipbl.org/update/"
BLOCKLIST=firehol_voipbl
curl $URL | iprange | while read line; do ipset add $BLOCKLIST $line; done


# sudo ipset create tms-itw_voip-bl hash:net
# curl https://raw.githubusercontent.com/it-world/ipblocker/main/blocked_voip_ips.txt | iprange | while read line; do ipset add tms-itw_voip-bl $line; done
# sudo iptables -I INPUT 13 -m state --state NEW -p tcp -m set --match-set tms-itw_voip-bl src -j REJECT --reject-with tcp-reset
#
URL="https://raw.githubusercontent.com/it-world/ipblocker/main/blocked_voip_ips.txt"
BLOCKLIST=tms-itw_voip-bl
curl $URL | iprange | while read line; do ipset add $BLOCKLIST $line; done


# sudo ipset create cisco_talos hash:net
# curl https://talosintelligence.com/documents/ip-blacklist | iprange | while read line; do ipset add cisco_talos $line; done
#  sudo iptables -I INPUT 13 -m state --state NEW -p tcp -m set --match-set cisco_talos src -j REJECT --reject-with tcp-reset
URL="https://talosintelligence.com/documents/ip-blacklist"
BLOCKLIST=cisco_talos
curl $URL | iprange | while read line; do ipset add $BLOCKLIST $line; done






