#!/bin/bash
echo "Usage: $0 hostname sslportnum"
echo "Analysing $1:$2"
openssl s_client -tls1 $1:$2   < httpreq.txt 2>&1 | grep -c "no protocols available" |sed "s/0/TLS 1.0 is supported/g; s/1/TLS 1.0 is not supported/g" 
openssl s_client -tls1_1 $1:$2 < httpreq.txt 2>&1 | grep -c "no protocols available" |sed "s/1/TLS 1.1 is not supported/g; s/0/TLS 1.1 is supported/g"
openssl s_client -tls1_2 $1:$2 < httpreq.txt 2>&1 | grep -c "no protocols available" |sed "s/1/TLS 1.2 is not supported/g; s/0/TLS 1.2 is supported/g"
openssl s_client -tls1_3 $1:$2 < httpreq.txt 2>&1 | grep -c "no protocols available" |sed "s/1/TLS 1.3 is not supported/g; s/0/TLS 1.3 is supported/g"
echo "Getting cipher list supported in TLS 1.2"
ciphers=$(openssl ciphers 'ALL:eNULL' | sed -e 's/:/ /g')
echo "Testing supported ciphers in TLS 1.2:"
for cipher in ${ciphers[@]}
do openssl s_client -tls1_2 -cipher "$cipher" $1:$2 <httpreq.txt 2>&1 | grep -c ": $cipher" | sed "s/0//g; s/1/$cipher/g" |grep .
done
echo "Getting cipher list supported in TLS 1.3"
ciphers="TLS_AES_256_GCM_SHA384 TLS_CHACHA20_POLY1305_SHA256 TLS_AES_128_GCM_SHA256 TLS_AES_128_CCM_8_SHA256 TLS_AES_128_CCM_SHA256"
echo "Testing supported ciphers in TLS 1.3:"
for cipher in ${ciphers[@]}
do openssl s_client -tls1_3 -ciphersuites "$cipher" $1:$2 <httpreq.txt 2>&1 | grep -c "Cipher is $cipher" | sed "s/0//g; s/1/$cipher/g" |grep .
done
