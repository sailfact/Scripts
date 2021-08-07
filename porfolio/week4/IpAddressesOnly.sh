#!/bin/bash

echo $(./ip_info.sh | sed -n '/IP Address: / p')

