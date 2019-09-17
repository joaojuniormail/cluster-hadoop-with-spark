#!/bin/bash

watch "hostname ; ip address | grep -oE ' (172[0-9\.]+)/' | sed -e 's;/;;g' -e 's;[[:space:]];;' ; echo -e '\n-----SERVIÇOS-----\n' ; jps"