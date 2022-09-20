# Check SSL Protocol given a Hostname and Port Number

These scripts check the open ports of the host. Put all  scripts in the same directory. Wrap this in another script to do automated open port checks on specific machines

Syntax: ./chkssl.sh hostname portnumber

The scripts are meant to be run in a linux machine or if you only have windows, to be run under Windows Subsystem for Linux (https://learn.microsoft.com/en-us/windows/wsl/install). You can run it under Cygwin64 (https://www.cygwin.com/) or MSys2 (https://www.msys2.org/) if you're security conscious and want to minimise the binaries installed under Windows.

## Pre-requisites

Install latest version of openssl, sed and grep if it isn't there via the command sudo apt install openssl sed grep

Sample output:

	./chkssl.sh www.google.com 443
	Usage: ./chkssl.sh hostname sslportnum
	Analysing www.google.com:443
	TLS 1.0 is not supported
	TLS 1.1 is not supported
	TLS 1.2 is supported
	TLS 1.3 is supported
	Getting cipher list supported in TLS 1.2
	Testing supported ciphers in TLS 1.2:
	ECDHE-ECDSA-AES256-GCM-SHA384
	ECDHE-RSA-AES256-GCM-SHA384
	ECDHE-ECDSA-CHACHA20-POLY1305
	ECDHE-RSA-CHACHA20-POLY1305
	ECDHE-ECDSA-AES128-GCM-SHA256
	ECDHE-RSA-AES128-GCM-SHA256
	ECDHE-ECDSA-AES256-SHA
	ECDHE-RSA-AES256-SHA
	ECDHE-ECDSA-AES128-SHA
	ECDHE-RSA-AES128-SHA
	AES256-GCM-SHA384
	AES128-GCM-SHA256
	AES256-SHA
	AES128-SHA
	Getting cipher list supported in TLS 1.3
	Testing supported ciphers in TLS 1.3:
	TLS_AES_256_GCM_SHA384
	TLS_CHACHA20_POLY1305_SHA256
	TLS_AES_128_GCM_SHA256
