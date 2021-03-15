#!/bin/bash
id=$(($(hostname | grep -Po "\d+") + 1))
id=${1:-$id}
config_path="/etc/clickhouse-server/config.d"
if [ $id -lt 3 ]
then
  snum=1
  rnum=$(($id/2+1))
  sed -i "s/snum/$snum/g" "$config_path/macros.xml"
  sed -i "s/rnum/$rnum/g" "$config_path/macros.xml"
else
  snum=2
  rnum=$(($id/4+1))
  sed -i "s/snum/$snum/g" "$config_path/macros.xml"
  sed -i "s/rnum/$rnum/g" "$config_path/macros.xml"
fi

#gosu root:root bash -c "clickhouse-server --config-file=/etc/clickhouse-server/config.xml"
gosu clickhouse:clickhouse bash -c "/usr/bin/clickhouse-server --config-file=/etc/clickhouse-server/config.xml"
