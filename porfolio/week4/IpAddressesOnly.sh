#!/bin/bash

echo $(./IpInfo.sh | sed -n '/IP Address: / p')

