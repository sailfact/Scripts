#!/bin/bash

# type password
read -sp "enter secret password :" password

sha256sum -c "secret.txt"