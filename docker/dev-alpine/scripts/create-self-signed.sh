#!/bin/sh
cd /certificates/self-signed

mkdir -p $ROOT/$NAME

openssl req \
	-new \
	-sha256 \
	-nodes \
	-out $ROOT/$NAME/$NAME.csr \
	-newkey rsa:4096 \
	-keyout $ROOT/$NAME/$NAME.key \
	-subj "/emailAddress=$EMAIL/C=$COUNTRY/ST=$STATE/L=$CITY/O=$ORGANIZATION/OU=$ORGANIZATIONAL_UNIT/CN=$NAME" \

echo -e "authorityKeyIdentifier=keyid,issuer\nbasicConstraints=CA:FALSE\nkeyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment\nsubjectAltName = @alt_names\n\n[alt_names]\nDNS.1 = $NAME" >> /var/v3.ext

openssl x509 \
	-req \
	-in $ROOT/$NAME/$NAME.csr \
	-CA ../root/$ROOT/$ROOT.pem \
	-CAkey ../root/$ROOT/$ROOT.key \
	-CAcreateserial \
	-out $ROOT/$NAME/$NAME.crt \
	-days 398 \
	-sha256 \
	-passin pass:$PASSWORD \
	-extfile /var/v3.ext

rm /var/v3.ext

echo "Ready."