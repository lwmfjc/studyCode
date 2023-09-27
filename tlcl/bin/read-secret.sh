#!/bin/bash
# read-secret:input a secret pass phrase
if read -t 5 -sp "Enter secret pass phrase > " secret_pass;then
	echo -e "\nSecret pass phrase = '$secret_pass'"
else
	echo -e "\nInput timed out" >&2
	exit 1
fi