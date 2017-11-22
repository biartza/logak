#!/bin/sh
echo "<div style='background-color:red; padding-left:40%; margin:3px; width:420px;  height:20px;'>" >> /var/www/html/logak.html

echo "Hona hemen gaurko logak: <a href='gailuak/"$(date -d "5 minutes ago" +"%F")".html'>"$(date)"</a>" >> /var/www/html/logak.html

echo "</div>" >> /var/www/html/logak.html
echo "</br>" >> /var/www/html/logak.html
url=$( date -d "5 minutes ago" +"%F" )
echo $url
echo "<div style='background-color:red; padding-left:40%; margin:3px; width:420px;  height:20px;'>" > /var/www/html/gailuak/$url.html
echo "Hona hemen gaurko logak: $(date)" >> /var/www/html/gailuak/$url.html
echo "</div>" >> /var/www/html/gailuak/$url.html
echo "</br>" >> /var/www/html/gailuak/$url.html

while read z; do
	echo "<div style='background-color:red; padding-left:40%; margin:3px; width:420px;  height:20px;'>" >> /var/www/html/gelak/$z.html

	echo "Hona hemen gela honetako: "$z" eta  gaurko logak: <a href='../gailuak/"$(date -d "5 minutes ago" +"%F")-$z".html'>"$(date)"</a>" >> /var/www/html/gelak/$z.html

	echo "</div>" >> /var/www/html/gelak/$z.html
	echo "</br>" >> /var/www/html/gelak/$z.html
	echo "<div style='background-color:red; padding-left:40%; margin:3px; width:420px;  height:20px;'>" > /var/www/html/gailuak/$url-$z.html
	echo "Hona hemen gela honetako: "$z" eta  gaurko logak: $(date)" >> /var/www/html/gailuak/$url-$z.html
	echo "</div>" >> /var/www/html/gailuak/$url-$z.html
	echo "</br>" >> /var/www/html/gailuak/$url-$z.html
done </home/script/gelak.info
exit 0
