FROM yandex/clickhouse-server
RUN mkdir /script
COPY init.sh /script/
COPY config.d/* /etc/clickhouse-server/config.d/
CMD /script/init.sh
