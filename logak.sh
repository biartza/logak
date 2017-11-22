#!/bin/bash
##awk -v date=$(date -d "5 minutes ago" +"%T") '$3 >= date { print $0 }' /var/log/syslog | grep inet | awk '{print $4}' > /tmp/gailuak.log
awk -v d1=$(date -d "5 minutes ago" +"%R") -v d2=$(date -d "0 minutes ago" +"%R") '$3 > d1 && $3 < d2 || $0 ~ d2' /var/log/syslog | grep inet | awk '{print $4}' > /tmp/gailuak.log
url=$( date -d "5 minutes ago" +"%F" )
echo $url
while read p; do
  echo "<div style='background-color:#97ff9e; padding-left:40%; margin:3px; width:420px;  height:20px;'>" >> /var/www/html/gailuak/$url.html
  echo "Honako gailua piztu da: <a href='"$p".html'>"$p"</a>" >> /var/www/html/gailuak/$url.html
  echo "</br>" >> /var/www/html/gailuak/$url.html
  echo "</div>" >> /var/www/html/gailuak/$url.html
  echo "<div style='background-color:white; padding:3px; margin:3px; width:420px;  height:20px;'>" >> /var/www/html/gailuak/$url.html
  echo "</br>" >> /var/www/html/gailuak/$url.html
  echo "</div>" >> /var/www/html/gailuak/$url.html

  awk -v d1=$(date -d "5 minutes ago" +"%R") -v d2=$(date -d "0 minutes ago" +"%R") '$3 > d1 && $3 < d2 || $0 ~ d2' /var/log/syslog | grep $p > /tmp/mezua.log
 ##awk -v date=$(date -d "5 minutes ago" +"%T") '$3 >= date { print $0 }' /var/log/syslog | grep $p > /tmp/mezua.log
  while read z; do
        echo "<div style='background-color:#97ff9e; padding-left:4px; margin:10px;'>" >> /var/www/html/gailuak/$p.html
        echo $z >> /var/www/html/gailuak/$p.html
        echo "</div>" >> /var/www/html/gailuak/$p.html
  done </tmp/mezua.log
done </tmp/gailuak.log
