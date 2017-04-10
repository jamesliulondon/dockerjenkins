curl -u dcadm:dcadm \
'http://10.137.14.163:8080/pluginManager/api/xml?depth=1&xpath=/*/*/shortName|/*/*/version&wrapper=plugins' |  \
xmllint --format - | \
sed  -e 's/<[^>]*>//g' \
     -e 's/^[ ]*//' \
     -e '/^$/d' |sed -e 'N;s/\n/ /'
