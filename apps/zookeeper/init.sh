#!/bin/bash
id=$(($(hostname | grep -Po "\d+") + 1))
echo "Zookeeper id: $id"
echo $id > /data/myid
echo "4lw.commands.whitelist=*" >> /conf/zoo.cfg
/apache-zookeeper-3.6.2-bin/bin/zkServer.sh --config /conf start-foreground
