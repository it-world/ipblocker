
  sudo ipset create tms-itw_voip-allowed hash:net
  curl https://raw.githubusercontent.com/it-world/ipblocker/main/allwaysallowed_voip_ips.txt | iprange | while read line; do ipset add tms-itw_voip-allowed $line; done
  sudo iptables -I INPUT 12 -m state --state NEW -p tcp -m set --match-set tms-itw_voip-allowed src -j ACCEPT

  sudo ipset create firehol_webserver hash:net
  curl https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/firehol_webserver.netset | iprange | while read line; do ipset add firehol_webserver $line; done
  sudo iptables -I INPUT 13 -m state --state NEW -p tcp -m set --match-set firehol_webserver src -j REJECT --reject-with tcp-reset
 


  sudo ipset create firehol_sip hash:net
  curl http://lists.blocklist.de/lists/sip.txt | iprange | while read line; do ipset add firehol_sip $line; done
  sudo iptables -I INPUT 13 -m state --state NEW -p tcp -m set --match-set firehol_sip src -j REJECT --reject-with tcp-reset
 


  sudo ipset create firehol_ssh hash:net
  curl http://lists.blocklist.de/lists/ssh.txt | iprange | while read line; do ipset add firehol_ssh $line; done
  sudo iptables -I INPUT 13 -m state --state NEW -p tcp -m set --match-set firehol_ssh src -j REJECT --reject-with tcp-reset
 


  sudo ipset create firehol_voipbl hash:net
  curl http://www.voipbl.org/update/ | iprange | while read line; do ipset add firehol_voipbl $line; done
  sudo iptables -I INPUT 13 -m state --state NEW -p tcp -m set --match-set firehol_voipbl src -j REJECT --reject-with tcp-reset
 


  sudo ipset create tms-itw_voip-bl hash:net
  curl https://raw.githubusercontent.com/it-world/ipblocker/main/blocked_voip_ips.txt | iprange | while read line; do ipset add tms-itw_voip-bl $line; done
  sudo iptables -I INPUT 13 -m state --state NEW -p tcp -m set --match-set tms-itw_voip-bl src -j REJECT --reject-with tcp-reset

  sudo ipset create cisco_talos hash:net
  curl https://talosintelligence.com/documents/ip-blacklist | iprange | while read line; do ipset add cisco_talos $line; done
  sudo iptables -I INPUT 13 -m state --state NEW -p tcp -m set --match-set cisco_talos src -j REJECT --reject-with tcp-reset




curl https://raw.githubusercontent.com/it-world/ipblocker/main/cronjob.sh >> /etc/cron.hourly/updateFirehol.sh
chmod +x /etc/cron.hourly/updateFirehol.sh

/etc/cron.hourly/updateFirehol.sh
