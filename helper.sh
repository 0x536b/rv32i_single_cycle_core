#!/bin/bash

set -eu

if [ "$#" -lt 1 ]; then
	echo "Usage: Provide atleast one argument to the script"
	exit 1
fi




$1