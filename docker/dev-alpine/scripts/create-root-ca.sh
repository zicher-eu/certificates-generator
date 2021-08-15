#!/bin/sh
cd /certificates/root

FILE_PRIVATE_KEY=$NAME/$NAME.key
if [ -f "$FILE_PRIVATE_KEY" ]; then
    echo "$FILE_PRIVATE_KEY exists, so we will renew certificate."
else 
    echo "$FILE_PRIVATE_KEY does not exist, so we will create new one thus new root certificate."
	
	mkdir $NAME
	
	openssl genrsa \
		-des3 \
		-passout pass:$PASSWORD \
		-out $NAME/$NAME.key 4096
fi

openssl req \
	-x509 \
	-new \
	-nodes \
	-key $NAME/$NAME.key \
	-sha256 \
	-days 3650 \
	-subj "/emailAddress=$EMAIL/C=$COUNTRY/ST=$STATE/L=$CITY/O=$ORGANIZATION/OU=$ORGANIZATIONAL_UNIT/CN=$COMMON_NAME" \
	-passin pass:$PASSWORD \
	-out $NAME/$NAME.pem

openssl x509 -outform der -in $NAME/$NAME.pem -out $NAME/$NAME.crt

echo "Ready."