#!/bin/bash
##====> for simple restapp
#nohup java -Dserver.port=8080 -jar /opt/restapp.jar  > /var/log/rest_service.log 2>&1 &

##====> for promethues
#nohup java -javaagent:/opt/jmx_prometheus_javaagent-0.1.0.jar=9090:tomcat.yml -jar /opt/restapp.jar > /var/log/rest_service.log 2>&1 &

##====> for newrelic
(cd /opt;nohup java  -Dserver.port=8090 -javaagent:/opt//newrelic/newrelic.jar -jar /opt/restapp.jar > /var/log/rest_new_service.log 2>&1 &)

#====> for datadog
#hostname="hostname: `hostname`"
#nohup stress-ng --vm 4 &
#sed -i "s/# hostname: mymachine.mydomain/$hostname/g" /etc/dd-agent/datadog.conf
#service datadog-agent start
while true; do
  sleep 1000
done
